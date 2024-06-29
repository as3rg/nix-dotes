local naughty = require("naughty")
local ruled = require('ruled')

-- Naughy property::suspended is not working, when there is no active notificaions (wtf idk)
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

ruled.notification.connect_signal("request::rules", function()
    ruled.notification.append_rule {
        rule = {},
        properties = {
            screen = screen.primary or awful.screen.preferred,
            position = beautiful.notification_position,
            spacing = beautiful.notification_spacing
        }
    }
    ruled.notification.append_rule {
        rule = {urgency = "low"},
        properties = {implicit_timeout = 3}
    }
    ruled.notification.append_rule {
        rule = {urgency = "normal"},
        properties = {implicit_timeout = 5}
    }
    ruled.notification.append_rule {
        rule = {urgency = "critical"},
        properties = {implicit_timeout = -1}
    }
end)

naughty.connect_signal("request::display", function(n)
    local urgency_color
    if n.urgency == "critical" then
        urgency_color = beautiful.urgent
    elseif n.urgency == "normal" then
        urgency_color = beautiful.pri
    else
        urgency_color = beautiful.fg
    end

    n.icon = n.icon or n.app_icon

    local actions = {
        widget = wibox.container.margin,
        left = beautiful.notification_margin,
        right = beautiful.notification_margin,
        -- top = beautiful.notification_margin,
        bottom = beautiful.notification_margin,
        wibox.widget {
            notification = n,
            base_layout = wibox.widget {
                spacing = beautiful.notification_button_spacing,
                horizontal_homogeneous = true,
                vertical_homogeneous = false,
                forced_num_cols = math.min(2, #n.actions),
                expand = true,
                layout = wibox.layout.grid
            },
            widget_template = {
                {
                    id = "text_role",
                    widget = wibox.widget.textbox,
                    align = "center",
                    wrap = "word_char",
                    ellipsize = "none"
                },
                widget = wibox.container.margin,
                left = beautiful.notification_button_margin,
                right = beautiful.notification_button_margin,
                top = beautiful.notification_button_margin,
                bottom = beautiful.notification_button_margin
            },
            -- forced_height = beautiful.get_font_height(beautiful.font) * 2.5,
            widget = naughty.list.actions
        }
    }
    local icon_widget_small = n.icon and {
        image = n.icon,
        widget = wibox.widget.imagebox,
        valign = "center",
        halign = "center",
        forced_height = beautiful.notification_title_size,
        forced_width = beautiful.notification_title_size
    }
    local icon_widget = n.icon and {
        image = n.icon,
        widget = wibox.widget.imagebox,
        valign = "center",
        halign = "center",
    }
    local header = {
        {
            widget = wibox.container.margin,
            left = beautiful.notification_margin,
            right = beautiful.notification_margin,
            top = beautiful.notification_margin,
            bottom = beautiful.notification_margin,
            {
                fill_space = true,
                layout = wibox.layout.fixed.horizontal,
                spacing = beautiful.notification_inner_spacing,
                icon_widget_small,
                {
                    widget = wibox.widget.textbox,
                    markup = n.app_name,
                    ellipsize = "end",
                    justify = false,
                    wrap = "word_char"
                }
            }
        },
        bg = beautiful.notification_header_bg,
        widget = wibox.container.background
    }
    n.title = "<b>"..n.title.."</b>"
    local body = {
        widget = wibox.container.margin,
        left = beautiful.notification_margin,
        right = beautiful.notification_margin,
        -- top = beautiful.notification_margin,
        -- bottom = beautiful.notification_margin,
        {
            fill_space = true,
            spacing = beautiful.notification_inner_spacing,
            layout = wibox.layout.fixed.vertical,
            {
                widget = naughty.widget.title,
                justify = true,
                wrap = "word_char",
                ellipsize = "none"
            },
            {
                widget = naughty.widget.message,
                justify = true,
                wrap = "word_char",
                ellipsize = "none"
            },
            -- icon_widget,
        }
    }
    naughty.layout.box {
        notification = n,
        bg = gears.color.transparent,
        maximum_height = beautiful.notification_max_height,
        maximum_width = beautiful.notification_max_width,
        shape = gears.shape.rectangle,
        border_width = 0,
        widget_template = {
            {
                header,
                body,
                actions,
                fill_space = false,
                spacing = beautiful.notification_inner_spacing,
                layout = wibox.layout.fixed.vertical
            },
            -- id = "background_role",
            bg = beautiful.notification_bg,
            fg = beautiful.notification_fg,
            border_width = beautiful.notification_border_width,
            border_color = urgency_color,
            shape = help.rrect(beautiful.border_radius),
            widget = wibox.container.background
        }
    }
end)

local notify_bat = false

local function notify_battery()
    naughty.notify({
        app_name = "Battery",
        title = "Low battery!",
        text = "Your battery capacity is below " .. tostring(beautiful.battery_low_border),
        urgency = "critical"
    })
end

awesome.connect_signal("bat::value", function(cap, status)
    if status:match("None") then
        return
    end
    local charging = (status == "Charging")
    if not charging and cap <= beautiful.battery_low_border then
        if not notify_bat then notify_battery() end
        notify_bat = true
    else
        notify_bat = false
    end
end)


return naughty
