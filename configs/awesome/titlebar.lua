local handle_floating = function(c)
    if c.first_tag and c.first_tag.layout.name == "floating" and not c.floating then
        c.floating = true
        return
    end
    if c.floating and not c.requests_no_titlebar then
        awful.titlebar.show(c, beautiful.titlebar_position)
    else
        awful.titlebar.hide(c, beautiful.titlebar_position)
    end
end

client.connect_signal("property::floating", handle_floating)

client.connect_signal("tagged", handle_floating)

awful.tag.attached_connect_signal(nil, "property::layout", function(t)
    local float = t.layout.name == "floating"
    for _, c in pairs(t:clients()) do 
        if float then 
            c.was_floating = c.floating
            c.floating = true
        else 
            c.floating = c.was_floating or false
        end
    end
end)

client.connect_signal("request::titlebars", function(c)

	if c.updating_toolbar then
		return
	end
	c.updating_toolbar = true
    local buttons = gears.table.join(awful.button({}, 1, function()
        client.focus = c
        c:raise()
        awful.mouse.client.move(c)
    end), awful.button({}, 3, function()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
    end))
    awful.titlebar(c, {size = beautiful.titlebar_size, position = beautiful.titlebar_position, font = beautiful.barfont }):setup{
    {
        awful.titlebar.widget.closebutton(c),
        awful.titlebar.widget.minimizebutton(c),
        awful.titlebar.widget.floatingbutton(c),
        -- awful.titlebar.widget.maximizedbutton(c),
        awful.titlebar.widget.ontopbutton(c),
        awful.titlebar.widget.stickybutton(c),
        layout = wibox.layout.fixed.horizontal()
    },
    { 
        {
            align  = 'center',
            widget = awful.titlebar.widget.titlewidget(c)
        },
        buttons = buttons,
        layout  = wibox.layout.flex.horizontal
    },
    layout = wibox.layout.align.horizontal
    }
    handle_floating(c)
	c.updating_toolbar = nil
end)
