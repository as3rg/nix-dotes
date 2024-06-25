return function(s)
    local layoutbox = awful.widget.layoutbox(s)

    layoutbox.forced_width = beautiful.layoutbox_icon_size

    layoutbox:buttons(gears.table.join(awful.button({}, 1, function() awful.layout.inc(1) end), 
    awful.button({}, 2, function() awful.tag.togglemfpol(t) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end), 
    awful.button({}, 4, function() awful.layout.inc(1) end), 
    awful.button({}, 5, function() awful.layout.inc(-1) end)))
    return {
        layoutbox,
        widget = wibox.container.place
    }
end
