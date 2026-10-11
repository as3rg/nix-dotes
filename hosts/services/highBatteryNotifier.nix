{ config, lib, pkgs, ...}:

with lib;

let
  cfg = config.services.highBatteryNotifier;
in {
  options = {
    services.highBatteryNotifier = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to enable high battery notifier.
        '';
      };
      device = mkOption {
        type = types.str;
        default = "BAT0";
        description = ''
          Device to monitor.
        '';
      };
      notifyCapacity = mkOption {
        type = types.ints.between 0 100;
        default = 100;
        description = ''
          Battery level at which a notification shall be sent.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.timers."highbatt" = {
      description = "check high battery level";
      timerConfig.OnBootSec = "1m";
      timerConfig.OnUnitInactiveSec = "5m";
      timerConfig.Unit = "highbatt.service";
      wantedBy = ["timers.target"];
    };
    systemd.services."highbatt" = {
      description = "high battery level notifier";
      serviceConfig = {
        User = "as3rg";
      };
      environment = {
          DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/1000/bus";
      };
      script = ''
        export battery_capacity=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/${cfg.device}/capacity)
        export battery_status=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/${cfg.device}/status)
        if [[ $battery_capacity -ge ${builtins.toString cfg.notifyCapacity} && $battery_status = "Charging" ]]; then
            ${pkgs.libnotify}/bin/notify-send --urgency=critical --hint=int:transient:1 -i ~/.config/battnotify/charged.png "Battery is over ${builtins.toString cfg.notifyCapacity}" "You should probably unplug."
        fi 
      '';
    };
  };
}
