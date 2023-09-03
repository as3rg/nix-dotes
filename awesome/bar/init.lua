local widgets = require("bar.widgets")

awful.screen.connect_for_each_screen(function(s)
    local right
    if s == screen.primary then
        right = wibox.widget {
            {
                widgets.tray,
                widgets.sep,
                widgets.net,
                widgets.bat,
                widgets.vol,
                widgets.notif,
                widgets.lang,
                widgets.sep,
                widgets.clock,
                spacing = beautiful.bar_spacing,
                layout = wibox.layout.fixed.horizontal
            },
            widget = wibox.container.place,
            halign = "right",
        }
    else 
        right = wibox.widget {
            {
                widgets.clock,
                spacing = beautiful.bar_spacing,
                layout = wibox.layout.fixed.horizontal
            },
            widget = wibox.container.place,
            halign = "right",
        }
    end

    local left = wibox.widget {
        require('bar.layoutbox')(s),
        require('bar.tasklist')(s),
        spacing = beautiful.bar_spacing,
        layout = wibox.layout.fixed.horizontal
    }

    local mid = wibox.widget {
        require('bar.taglist')(s),
        spacing = beautiful.bar_spacing,
        layout = wibox.layout.fixed.horizontal
    }

    local bar = awful.wibar({
        position = "top",
        bg = gears.color.transparent,
        height = beautiful.bar_height,
        screen = s,
        opacity = beautiful.bar_opacity
    })
    bar:setup{
        {
            {
                {left, mid, right, layout = wibox.layout.align.horizontal, expand = "outside"},

                top = beautiful.bar_inner_gap,
                left = beautiful.bar_inner_gap,
                right = beautiful.bar_inner_gap,
                bottom = beautiful.bar_inner_gap,
                widget = wibox.container.margin
            },
            shape = help.rrect(beautiful.border_radius),
            border_width = beautiful.bar_border_width,
            border_color = beautiful.bar_border_color,
            bg = beautiful.bg,
            fg = beautiful.fg,
            widget = wibox.container.background
        },
        top = beautiful.bar_gap,
        left = beautiful.bar_gap,
        right = beautiful.bar_gap,
        -- bottom = beautiful.bar_gap,
        widget = wibox.container.margin
    }
    s.bar = bar
    return bar
end)
