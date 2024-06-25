return function(theme)

    local theme_path = require("gears.filesystem").get_configuration_dir() ..
                           "/theme/"
    theme.font = 'JetBrainsMono Nerd Font 12'
    theme.barfont = 'JetBrainsMono Nerd Font Propo 10'
    theme.icofont = 'JetBrainsMono Nerd Font Propo 14'

    -- theme.ok = "#8C977D"

    theme.useless_gap = dpi(2)
    theme.snap_bg = theme.fg2

    theme.border_width = dpi(2)
    theme.border_focus = theme.pri
    theme.border_normal = theme.bg
    theme.border_urgent = theme.urgent
    theme.border_radius = dpi(5)

    theme.tasklist_plain_task_name = true

    theme.separator_color = theme.fg2

    -- Layoutbox
    theme.layout_fairh = theme_path .. "layouts/fairhw.png"
    theme.layout_fairv = theme_path .. "layouts/fairvw.png"
    theme.layout_floating = theme_path .. "layouts/floatingw.png"
    theme.layout_magnifier = theme_path .. "layouts/magnifierw.png"
    theme.layout_max = theme_path .. "layouts/maxw.png"
    theme.layout_fullscreen = theme_path .. "layouts/fullscreenw.png"
    theme.layout_tilebottom = theme_path .. "layouts/tilebottomw.png"
    theme.layout_tileleft = theme_path .. "layouts/tileleftw.png"
    theme.layout_tile = theme_path .. "layouts/tilew.png"
    theme.layout_tiletop = theme_path .. "layouts/tiletopw.png"
    theme.layout_spiral = theme_path .. "layouts/spiralw.png"
    theme.layout_dwindle = theme_path .. "layouts/dwindlew.png"
    theme.layout_cornernw = theme_path .. "layouts/cornernww.png"
    theme.layout_cornerne = theme_path .. "layouts/cornernew.png"
    theme.layout_cornersw = theme_path .. "layouts/cornersww.png"
    theme.layout_cornerse = theme_path .. "layouts/cornersew.png"
    theme.layout_columns = theme_path .. "layouts/columnsw.png"
    theme.layoutbox_icon_size = dpi(20)

    -- Tray theme
    theme.bg_systray = theme.bg

    -- Bar theme
    theme.bar_border_color = theme.fg2
    theme.bar_border_width = dpi(0)
    theme.bar_gap = 2 * theme.useless_gap
    theme.bar_inner_gap = dpi(5)
    theme.bar_spacing = dpi(15)
    theme.bar_height = dpi(30)
    theme.bar_opacity = 1

    -- Taglist
    theme.taglist_fg_focus = theme.pri
    theme.taglist_fg_urgent = theme.urgent
    theme.taglist_fg_occupied = theme.fg
    theme.taglist_fg_empty = theme.fg2
    theme.taglist_fg_volatile = theme.fg

    theme.taglist_bg = gears.color.transparent
    theme.taglist_bg_focus = theme.taglist_bg
    theme.taglist_bg_urgent = theme.taglist_bg
    theme.taglist_bg_occupied = theme.taglist_bg
    theme.taglist_bg_empty = theme.taglist_bg
    theme.taglist_bg_volatile = theme.taglist_bg
    theme.taglist_font = theme.barfont

    -- Battery
    theme.battery_low = theme.urgent
    theme.battery_low_border = 25

    -- Notifications
    theme.notification_bg = theme.bg
    theme.notification_header_bg = theme.bg3
    theme.notification_fg = theme.fg
    theme.notification_max_height = dpi(1000)
    theme.notification_max_width = dpi(400)
    theme.notification_icon_size = dpi(50)
    theme.notification_spacing = dpi(5)
    theme.notification_position = "bottom_right"
    theme.notification_margin = dpi(5)
    theme.notification_button_spacing = dpi(5)
    theme.notification_inner_spacing = dpi(5)
    -- theme.notification_border_color = theme.fg2
    theme.notification_border_width = dpi(2)
    theme.notification_type_icon = theme_path.."rect.svg"
    theme.notification_title_size = dpi(20)

    -- naughty.config.defaults.border_width = beautiful.notification_border_width

    -- -- naughty.config.defaults.title = "Notification"

    -- naughty.config.defaults.fg = beautiful.fg
    -- naughty.config.defaults.bg = beautiful.bg

    -- Notification center theme
    theme.notifcenter_gap = 2 * theme.useless_gap
    theme.notifcenter_inner_gap = dpi(10)
    theme.notifcenter_block_inner_gap = dpi(10)
    theme.notifcenter_block_border_radius = dpi(15)
    theme.notifcenter_spacing = dpi(10)
    theme.notifcenter_width = dpi(400)
    theme.notifcenter_opacity = theme.bar_opacity

    -- Titlebar
    theme.titlebar_size = dpi(20)
    theme.titlebar_position = "top"
    theme.titlebar_icon_size = dpi(20)
    theme.titlebar_bg = theme.bg3
    theme.titlebar_icon_margin = dpi(10)
    local button_active = gears.color.recolor_image(theme_path.."rect.svg", theme.fg)
    local button_inactive = gears.color.recolor_image(theme_path.."rect.svg", theme.fg2)
    for _, name in ipairs({ "ontop", "sticky", "floating", "maximized" }) do
        for _, type in ipairs({"normal", "focus"}) do
            theme["titlebar_"..name.."_button_"..type] = button_inactive
            theme["titlebar_"..name.."_button_"..type.."_inactive"] = button_inactive
        end
        for _, type in ipairs({"active", "normal_active", "focus_active"}) do
            theme["titlebar_"..name.."_button_"..type] = button_active
        end
    end
    for _, type in ipairs({"normal", "focus", "active", "normal_active", "focus_active"}) do
        theme["titlebar_minimize_button_"..type] = gears.color.recolor_image(theme_path.."rect.svg", theme.pri)
    end
    for _, type in ipairs({"normal", "focus", "active", "normal_active", "focus_active"}) do
        theme["titlebar_close_button_"..type] = gears.color.recolor_image(theme_path.."rect.svg", theme.urgent)
    end

    -- Taskbar
    theme.tasklist_bg_normal = gears.color.transparent
    theme.tasklist_bg_focus = theme.pri
    theme.tasklist_bg_urgent = theme.urgent
    theme.tasklist_bg_minimize = theme.fg2
    theme.tasklist_button_margin = dpi(1)
    return theme

end
