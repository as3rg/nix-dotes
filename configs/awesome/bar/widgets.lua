local M = {}

-- Tray
local tray = wibox.widget.systray()
tray.set_horizontal(true)
M.tray = {tray, align = "center", widget = wibox.container.place}

-- Clock
M.clock = wibox.widget {
    font = beautiful.barfont,
    format = "%a %d.%m %H:%M",
    refresh = 1,
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textclock
}

-- Language
M.lang = wibox.widget {
    font = beautiful.barfont,
    align = 'center',
    widget = wibox.widget.textbox
}

local keyboards = {"en", "ru"}
local update_layout = function()
    M.lang.markup = keyboards[awesome.xkb_get_layout_group() + 1]
end
awesome.connect_signal("xkb::map_changed", update_layout)
awesome.connect_signal("xkb::group_changed", update_layout);

-- Notifications
M.notif = wibox.widget {
    font = beautiful.barfont,
    align = 'center',
    widget = wibox.widget.textbox
}
local naughty_handler = function(val)
    if val then
        M.notif.markup = ""
    else
        M.notif.markup = ""
    end
end
awesome.connect_signal("notif::suspended", naughty_handler)
naughty_handler(naughty.suspended)

-- Volume
M.vol = wibox.widget {
    font = beautiful.barfont,
    align = 'center',
    widget = wibox.widget.textbox
}

awesome.connect_signal("vol::value", function(muted, volume)
    local icon
    if muted then
        icon = "󰝟"
    else
        icon = "󰕾"
    end
    M.vol.markup = icon .. " " .. tostring(volume)
end)

-- Battery
local bat_icon = wibox.widget {
    font = beautiful.barfont,
    align = 'center',
    widget = wibox.widget.textbox
}
M.bat = wibox.widget {bat_icon, widget = wibox.container.background}

awesome.connect_signal("bat::value", function(cap, status)
	M.bat.visible = not status:match("None")
    local charging = status:match("Charging")
    local icon
    if charging then
        icon = "󱐋"
    else
        icon = ""
    end
    bat_icon.markup = icon .. " " .. tostring(cap)
    if not charging and cap <= beautiful.battery_low_border then
        M.bat.fg = beautiful.battery_low
    else
        M.bat.fg = beautiful.fg
    end
end)

-- Network
M.net = wibox.widget {
    font = beautiful.barfont,
    align = 'center',
    widget = wibox.widget.textbox
}

local net_icon = {
    [0] = "?",
    [10] = "󰤮",
    [20] = "󰤯",
    [30] = "󱛆",
    [40] = "󱛆",
    [50] = "󱚼",
    [60] = "󱚵",
    [70] = "󰖩",
}

local net_tooltip = awful.tooltip {
    objects        = { M.net }
}

awesome.connect_signal("net::value", function(stateId, name)
    if name and #name > 0 then
        net_tooltip.text = name
        M.net.markup = net_icon[stateId] .. " " .. help.wrap(name, 15)
    else
        net_tooltip.text = "―"
        M.net.markup = net_icon[stateId]
    end
end)

-- Separator
M.sep = wibox.widget {
    {
        forced_width = dpi(2),
        shape = gears.shape.line,
        widget = wibox.widget.separator
    },
    widget = wibox.container.margin
}

return M
