#!/usr/bin/env python3
"""Minimal freedesktop notification daemon that renders through eww."""
import json
import os
import subprocess
import time

from gi.repository import Gio, GLib

OBJ = "/org/freedesktop/Notifications"
IFACE = "org.freedesktop.Notifications"
RUNTIME = os.environ.get("XDG_RUNTIME_DIR", "/tmp")
DND = os.path.join(RUNTIME, "eww-notif-dnd")
STATE_DIR = os.path.join(RUNTIME, "eww-notif")
HISTORY = os.path.join(STATE_DIR, "history.json")
HISTORY_MAX = 30

XML = """
<node>
  <interface name="org.freedesktop.Notifications">
    <method name="Notify">
      <arg type="s" name="app_name" direction="in"/>
      <arg type="u" name="replaces_id" direction="in"/>
      <arg type="s" name="app_icon" direction="in"/>
      <arg type="s" name="summary" direction="in"/>
      <arg type="s" name="body" direction="in"/>
      <arg type="as" name="actions" direction="in"/>
      <arg type="a{sv}" name="hints" direction="in"/>
      <arg type="i" name="expire_timeout" direction="in"/>
      <arg type="u" name="id" direction="out"/>
    </method>
    <method name="CloseNotification">
      <arg type="u" name="id" direction="in"/>
    </method>
    <method name="GetCapabilities">
      <arg type="as" name="capabilities" direction="out"/>
    </method>
    <method name="GetServerInformation">
      <arg type="s" name="name" direction="out"/>
      <arg type="s" name="vendor" direction="out"/>
      <arg type="s" name="version" direction="out"/>
      <arg type="s" name="spec_version" direction="out"/>
    </method>
    <signal name="NotificationClosed">
      <arg type="u" name="id"/>
      <arg type="u" name="reason"/>
    </signal>
    <signal name="ActionInvoked">
      <arg type="u" name="id"/>
      <arg type="s" name="action_key"/>
    </signal>
  </interface>
</node>
"""


def eww(*args):
    try:
        subprocess.run(
            ["eww", *args],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            timeout=3,
        )
    except Exception:
        pass


def load_history():
    try:
        with open(HISTORY, encoding="utf-8") as f:
            data = json.load(f)
        if isinstance(data, list):
            return data[-HISTORY_MAX:]
    except Exception:
        pass
    return []


def save_history(history):
    try:
        os.makedirs(STATE_DIR, exist_ok=True)
        tmp = HISTORY + ".tmp"
        with open(tmp, "w", encoding="utf-8") as f:
            json.dump(history[-HISTORY_MAX:], f, ensure_ascii=False, separators=(",", ":"))
        os.replace(tmp, HISTORY)
    except Exception:
        pass


class Daemon:
    def __init__(self):
        self.conn = None
        self.next_id = 1
        self.latest_id = 0
        self.history = load_history()
        self.timer = None

    def bus_acquired(self, conn, name):
        self.conn = conn
        info = Gio.DBusNodeInfo.new_for_xml(XML).interfaces[0]
        conn.register_object(OBJ, info, self.on_method, None, None)
        eww("update", "dnd=" + ("on" if os.path.exists(DND) else "off"))

    def on_method(self, conn, sender, path, iface, method, params, inv):
        if method == "Notify":
            self.notify(params, inv)
        elif method == "CloseNotification":
            (nid,) = params.unpack()
            self.close(nid, 3)
            inv.return_value(None)
        elif method == "GetCapabilities":
            inv.return_value(GLib.Variant("(as)", (["body", "icon-static"],)))
        elif method == "GetServerInformation":
            inv.return_value(
                GLib.Variant("(ssss)", ("eww-notifd", "eww", "1.0", "1.2"))
            )
        else:
            inv.return_value(None)

    def notify(self, params, inv):
        app, _rid, _icon, summary, body, _actions, _hints, _expire = params.unpack()
        nid = self.next_id
        self.next_id += 1

        self.history.append(
            {
                "app": app or "Notification",
                "summary": summary or "",
                "body": body or "",
                "time": time.strftime("%H:%M"),
            }
        )
        self.history = self.history[-HISTORY_MAX:]
        save_history(self.history)

        inv.return_value(GLib.Variant("(u)", (nid,)))

        if not os.path.exists(DND):
            self.latest_id = nid
            eww("update", "notif_app=" + (app or ""))
            eww("update", "notif_summary=" + (summary or ""))
            eww("update", "notif_body=" + (body or ""))
            eww("update", "notif_time=" + time.strftime("%H:%M"))
            eww("open", "notif")
            if self.timer:
                GLib.source_remove(self.timer)
            self.timer = GLib.timeout_add(6000, self.on_timeout)

    def on_timeout(self):
        self.timer = None
        self.close(self.latest_id, 1)
        return False

    def close(self, nid, reason):
        if self.conn is not None and nid:
            try:
                self.conn.emit_signal(
                    None,
                    OBJ,
                    IFACE,
                    "NotificationClosed",
                    GLib.Variant("(uu)", (nid, reason)),
                )
            except Exception:
                pass
        if nid == self.latest_id:
            eww("close", "notif")


def main():
    daemon = Daemon()
    Gio.bus_own_name(
        Gio.BusType.SESSION,
        IFACE,
        Gio.BusNameOwnerFlags.NONE,
        daemon.bus_acquired,
        None,
        None,
    )
    GLib.MainLoop().run()


if __name__ == "__main__":
    main()
