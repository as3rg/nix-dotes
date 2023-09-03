local naughty = require("naughty.core")

local old_suspend = naughty.suspend
local old_resume = naughty.resume
naughty.resume = function() 
    old_resume()
    awesome.emit_signal("notif::suspended", true)
end

naughty.suspend = function() 
    old_suspend()
    awesome.emit_signal("notif::suspended", false)
end

for k,v in pairs(beautiful.notification_common) do naughty.config.defaults[k] = v end
naughty.config.presets.low = beautiful.notification_low
naughty.config.presets.normal = beautiful.notification_normal
naughty.config.presets.critical = beautiful.notification_critical

naughty.config.defaults.position = "top_right"
naughty.config.defaults.ontop = true
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.shape = help.rrect(beautiful.border_radius)

naughty.config.padding = beautiful.notification_padding
naughty.config.spacing = beautiful.notification_spacing


local notify_bat = true

local function notify_battery()
    naughty.notify({
        title = "Low battery!",
        text = "Your battery capacity is below " .. tostring(beautiful.battery_low_border),
        preset = naughty.config.presets.critical
    })
end

awesome.connect_signal("bat::value", function(cap, status)
    local charging = (status == "Charging")
    if not charging and cap < beautiful.battery_low_border then
        if not notify_bat then notify_battery() end
        notify_bat = true
    else
        notify_bat = false
    end
end)

-- require(naughty) ignores naughty.config.presets

if dbus then
  naughty.dbus = require("naughty.dbus")
end
return naughty