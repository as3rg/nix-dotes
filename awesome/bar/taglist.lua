return function(s)
    local taglist_buttons = gears.table.join(
                                awful.button({}, 1, function(c)
            c:emit_signal("request::select", "taglist", {raise = true})
        end))

    local tag = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        layout = {spacing = dpi(10), layout = wibox.layout.fixed.horizontal},
        widget_template = {
            {
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox,
                    font = beautiful.taglist_font
                },
                widget = wibox.container.place
            },
            id = "background_role",
            widget = wibox.container.background
        },
        buttons = taglist_buttons
    }
    return tag
end
