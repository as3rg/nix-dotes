local infos = require("notifcenter.info")

local function block(content)
    local res = wibox.widget {
        {
            content,
            top = beautiful.notifcenter_block_inner_gap,
            left = beautiful.notifcenter_block_inner_gap,
            right = beautiful.bar_gnotifcenter_block_inner_gapap,
            bottom = beautiful.notifcenter_block_inner_gap,
            widget = wibox.container.margin
        },
        shape = help.rrect(beautiful.notifcenter_block_border_radius),
        bg = beautiful.bg2,
        fg = beautiful.fg,
        widget = wibox.container.background
    }
    return res
end

awful.screen.connect_for_each_screen(function(s)

    -- local info = block({
    --     infos.net,
    --     infos.blu,
    --     -- widgets.tray,
    --     -- widgets.sep,
    --     -- widgets.net,
    --     -- widgets.bat,
    --     -- widgets.vol,
    --     -- widgets.sep,
    --     -- widgets.clock,
    --     spacing = beautiful.notifcenter_spacing,
    --     layout = wibox.layout.fixed.vertical
    -- })

    local notifcenter = awful.wibar({
        position = "left",
        bg = gears.color.transparent,
        width = beautiful.notifcenter_width,
        screen = s,
        visible = false,
        opacity = beautiful.bar_opacity
    })
    local grid = wibox.widget {
        forced_num_cols = 5,
        homogeneous   = true,
        horizontal_expand = true,
        layout = wibox.layout.grid.vertical
    }
    grid:add_widget_at(block(infos.net), 1, 1, 2, 2)
    grid:add_widget_at(block(infos.blu), 1, 3, 2, 2)
    notifcenter:setup{
        {
            {
                grid,
                top = beautiful.notifcenter_inner_gap,
                left = beautiful.notifcenter_inner_gap,
                right = beautiful.notifcenter_inner_gap,
                bottom = beautiful.notifcenter_inner_gap,
                widget = wibox.container.margin
            },
            shape = help.rrect(beautiful.border_radius),
            bg = beautiful.bg,
            fg = beautiful.fg,
            widget = wibox.container.background
        },
        top = beautiful.notifcenter_gap,
        left = beautiful.notifcenter_gap,
        -- right = beautiful.bar_gap,
        bottom = beautiful.notifcenter_gap,
        widget = wibox.container.margin
    }
    s.notifcenter = notifcenter
    return notifcenter
end)
