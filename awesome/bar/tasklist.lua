return function(s)
    local tasklist_buttons = gears.table.join(
                                awful.button({}, 1, function(c)
                                    -- if c.active
            if client.focus == c then
                c.minimized = not c.minimized
            else
                c:emit_signal("request::activate", "tasklist", {raise = true})
            end
        end))

    local tag = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        layout = {spacing = dpi(10), layout = wibox.layout.fixed.horizontal},
        widget_template = {
            {
                {
                    id = 'icon_role',
                    widget = wibox.widget.imagebox,
                },
                left = beautiful.tasklist_button_margin,
                right = beautiful.tasklist_button_margin,
                top = beautiful.tasklist_button_margin,
                bottom = beautiful.tasklist_button_margin,
                widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background
        },
        buttons = tasklist_buttons
    }
    return tag
end
