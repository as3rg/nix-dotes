-- Variables
local keys = {}

local mod = 'Mod4'

local step = dpi(10)
local col_fact_step = 0.1

local swap_tags = function (screen1, screen2)
    local tag1 = screen1.selected_tag
    local tag2 = screen2.selected_tag
    tag1:swap(tag2) 
    tag1.name, tag2.name = tag2.name, tag1.name
    tag1:view_only()
    tag2:view_only()
end

local floating = function (c) 
    return (c.first_tag.layout == awful.layout.suit.floating or c.floating) and not c.maximized and not c.fullscreen
end 

local get_all_clients = function () 
    cls = {}
    for _, c in ipairs(client.get()) do
        if not (c.skip_taskbar or c.hidden
            or c.type == "splash" or c.type == "dock" or c.type == "desktop") 
            and awful.widget.tasklist.filter.currenttags(c, awful.screen.focused()) then
            table.insert(cls, c)
        end
    end
    return cls
end

keys.globalkeys = gears.table.join(
    awful.key({mod, "Control"}, "r", awesome.restart), 
    awful.key({mod, "Control", "Mod1", "Shift"}, "q", function() 
        kill_processes()
        awesome.quit()
    end), 

    -- Fn keys
    awful.key({}, "XF86AudioMute", function() awful.spawn("pamixer --toggle-mute", false) end),
    awful.key({}, "XF86AudioLowerVolume", function() awful.spawn("pamixer -d 5 --set-limit 200 --allow-boost", false) end), 
    awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn("pamixer -i 5 --set-limit 200 --allow-boost", false) end), 
    awful.key({}, "XF86MonBrightnessUp", function() awful.spawn("brightnessctl set +10%", false) end), 
    awful.key({}, "XF86MonBrightnessDown", function() awful.spawn("brightnessctl set 10%-", false) end),


    -- Media keys
    awful.key({}, "XF86AudioPlay", function() awful.spawn("playerctl play-pause", false) end),
    awful.key({}, "XF86AudioPause", function() awful.spawn("playerctl pause", false) end), 
    awful.key({}, "XF86AudioStop", function() awful.spawn("playerctl stop", false) end),
    -- awful.key({}, "XF86AudioPlayPause", function () awful.spawn("playerctl play-pause", false) end),
    awful.key({}, "XF86AudioNext", function() awful.spawn("playerctl next", false) end),
    awful.key({}, "XF86AudioPrev", function() awful.spawn("playerctl previous", false) end),

    awful.key({mod}, "p", function () awful.spawn("playerctl play-pause", false) end),
    awful.key({mod}, "[", function() awful.spawn("playerctl previous", false) end),
    awful.key({mod}, "]", function() awful.spawn("playerctl next", false) end),

    -- Switch layout
    awful.key({mod}, '\\', function() awful.layout.inc(1) end),
    awful.key({mod, "Shift"}, '\\', function() awful.layout.inc(-1) end),

    -- Focus move
    awful.key({mod}, 'Tab', function() awful.client.focus.byidx(1) end),
    awful.key({mod, "Shift"}, 'Tab', function() awful.client.focus.byidx(-1) end),
    awful.key({mod}, "Left", function() awful.client.focus.global_bydirection("left") end),
    awful.key({mod}, "Down", function() awful.client.focus.global_bydirection("down") end),
    awful.key({mod}, "Up", function() awful.client.focus.global_bydirection("up") end),
    awful.key({mod}, "Right", function() awful.client.focus.global_bydirection("right") end),

    -- Screen focus move
    awful.key({mod, "Mod1"}, 'Tab', function() awful.screen.focus_relative(1) end),
    awful.key({mod, "Shift", "Mod1"}, 'Tab', function() awful.screen.focus_relative(-1) end),
    awful.key({mod, "Mod1"}, "Left", function() awful.screen.focus_bydirection("left") end),
    awful.key({mod, "Mod1"}, "Down", function() awful.screen.focus_bydirection("down") end),
    awful.key({mod, "Mod1"}, "Up", function() awful.screen.focus_bydirection("up") end),
    awful.key({mod, "Mod1"}, "Right", function() awful.screen.focus_bydirection("right") end),

    -- Swap tags
    awful.key({mod, "Control", "Mod1"}, "Left", function()
        swap_tags(awful.screen.focused(), awful.screen.focused():get_next_in_direction("left"))
    end),
    awful.key({mod, "Control", "Mod1"}, "Down", function() 
        swap_tags(awful.screen.focused(), awful.screen.focused():get_next_in_direction("down"))
    end),
    awful.key({mod, "Control", "Mod1"}, "Up", function() 
        swap_tags(awful.screen.focused(), awful.screen.focused():get_next_in_direction("up"))
    end),
    awful.key({mod, "Control", "Mod1"}, "Right", function() 
        swap_tags(awful.screen.focused(), awful.screen.focused():get_next_in_direction("right"))
    end),

    -- Toggle left bar
    awful.key({mod, "Shift"}, 'f', function()
        local cur = awful.screen.focused()
        if cur.bar then
            cur.bar.visible = not cur.bar.visible
            if cur.notifcenter then
                cur.notifcenter.visible = cur.notifcenter.visible and cur.bar.visible
            end
        end
    end), 

    -- Toggle notification bar
    awful.key({mod, "Shift"}, 'n', function()
        local cur = awful.screen.focused()
        if cur.notifcenter and cur.notifcenter.visible then
            cur.notifcenter.visible = false
        else
            for s in screen do
                if s.notifcenter then s.notifcenter.visible = false end
            end
            if cur.notifcenter then
                cur.notifcenter.visible = true
                if cur.bar then cur.bar.visible = true end
            end
        end
    end), 

    -- Toggle notifications
    awful.key({mod}, 'n', function() naughty.toggle() end),

    -- Apps
    awful.key({mod}, "s", function() awful.spawn("flameshot gui", false) end),
    awful.key({}, "Print", function() awful.spawn("flameshot gui", false) end),
    awful.key({mod, "Shift"}, "s", function() awful.spawn(
        'bash -c "flameshot gui -r -s | tesseract - - -l eng+rus quiet --layout --psm 11 | xclip -selection clipboard"', false) end),
    awful.key({mod}, "Return", function() awful.spawn("kitty", false) end),
    awful.key({mod}, "w", function() awful.spawn("firefox", false) end),
    awful.key({mod}, ".", function() awful.spawn('rofi -show emoji -modi emoji', false) end),
    awful.key({mod}, "/", function() awful.spawn('rofi -show calc -modi calc -no-show-match -no-sort', false) end),
    awful.key({mod}, "l", function() awful.spawn("xsecurelock", false) end),
    awful.key({mod}, "r", function() awful.spawn("rofi -show drun -show-icons", false) end),
    awful.key({mod, "Shift"}, "r", function() awful.spawn("kitty ranger", false) end),
    awful.key({mod, "Shift"}, "t", function() awful.spawn("kitty htop", false) end),
    awful.key({mod, "Shift"}, "w", function() awful.spawn("kitty nmtui", false) end),
    awful.key({mod, "Shift"}, "b", function() awful.spawn("kitty bluetuith", false) end),
    awful.key({mod, "Shift"}, "m", function() awful.spawn("kitty pulsemixer", false) end),

    -- Normalize Columns layout
    awful.key({mod}, "d", function() 
        if awful.screen.focused().selected_tag.layout == layouts.columns then
            layouts.columns.normalize(awful.screen.focused().selected_tag)
        end
    end),

    -- Change wallpaper
    awful.key({mod, "Control"}, "w", set_wallpaper),
   
    -- Change display mode
    awful.key({mod, "Control", "Shift", "Mod1"}, "Left", function(c) awful.spawn("autorandr left", false) end),
    awful.key({mod, "Control", "Shift", "Mod1"}, "Down", function(c) awful.spawn("autorandr single", false) end),
    awful.key({mod, "Control", "Shift", "Mod1"}, "Right", function(c) awful.spawn("autorandr right", false) end)
)

-- awful.keyboard Control
keys.clientkeys = gears.table.join(
    awful.key({mod}, 'q', function(c) c:kill() end),
    awful.key({mod}, 'f', function(c) c.fullscreen = not c.fullscreen; c:raise() end),
    awful.key({mod}, 'v', function(c) awful.client.floating.toggle(c) end),
    awful.key({mod}, 't', function(c) c.ontop = not c.ontop end),
    awful.key({mod}, 'h', function(c) c.minimized = not c.minimized end),
    awful.key({mod}, 'k', function(c) c.sticky = not c.sticky end),

    -- Switch between windows
    awful.key({mod, "Control"}, 'Left', function(c) 
        if floating(c) then
            awful.client.moveresize(0, 0, -step, 0)
        elseif c.first_tag.layout == layouts.columns then
            layouts.columns.inccfact(-col_fact_step, c)
        else
            awful.tag.incmwfact(-0.025) 
        end
    end), 
    awful.key({mod, "Control"}, 'Down', function(c) 
        if floating(c) then
            awful.client.moveresize(0, 0, 0, step)
        elseif c.first_tag.layout == layouts.columns then
            layouts.columns.incrfact(-col_fact_step, c)
        else
            awful.client.incwfact(-0.05) 
        end
    end),
    awful.key({mod, "Control"}, 'Up', function(c) 
        if floating(c) then
            awful.client.moveresize(0, 0, 0, -step)
        elseif c.first_tag.layout == layouts.columns then
            layouts.columns.incrfact(col_fact_step, c)
        else
            awful.client.incwfact(0.05) 
        end
    end), 
    awful.key({mod, "Control"}, 'Right', function(c) 
        if floating(c) then
            awful.client.moveresize(0, 0, step, 0)
        elseif c.first_tag.layout == layouts.columns then
            layouts.columns.inccfact(col_fact_step, c)
        else
            awful.tag.incmwfact(0.025) 
        end
    end),

    -- Move inside tag
    awful.key({mod, "Shift"}, "Left", function(c)
        if floating(c) then
            awful.client.moveresize(-step, 0, 0, 0, c)
        elseif c.first_tag.layout == layouts.columns then
            layouts.columns.change_col_relative(-1, c)
        else
            awful.client.swap.bydirection("left", c) 
        end
    end),
    awful.key({mod, "Shift"}, "Down", function(c) 
        if floating(c) then
            awful.client.moveresize(0, step, 0, 0, c)
        else
            awful.client.swap.bydirection("down", c) 
        end
    end),
    awful.key({mod, "Shift"}, "Up", function(c) 
        if floating(c) then
            awful.client.moveresize(0, -step, 0, 0, c)
        else
            awful.client.swap.bydirection("up", c) 
        end 
    end),
    awful.key({mod, "Shift"}, "Right", function(c) 
        if floating(c) then
            awful.client.moveresize(step, 0, 0, 0, c)
        elseif c.first_tag.layout == layouts.columns then
            layouts.columns.change_col_relative(1, c)
        else
            awful.client.swap.bydirection("right", c) 
        end 
    end),

    -- Move to screen
    awful.key({mod, "Shift", "Mod1"}, "Left", function(c) 
        local new_screen = c.screen:get_next_in_direction("left")
        c:move_to_tag(new_screen.selected_tag) 
        awful.screen.focus(new_screen)
    end),
    awful.key({mod, "Shift", "Mod1"}, "Down", function(c) 
        local new_screen = c.screen:get_next_in_direction("down")
        c:move_to_tag(new_screen.selected_tag) 
        awful.screen.focus(new_screen)
    end),
    awful.key({mod, "Shift", "Mod1"}, "Up", function(c) 
        local new_screen = c.screen:get_next_in_direction("up")
        c:move_to_tag(new_screen.selected_tag) 
        awful.screen.focus(new_screen)
    end),
    awful.key({mod, "Shift", "Mod1"}, "Right", function(c) 
        local new_screen = c.screen:get_next_in_direction("right")
        c:move_to_tag(new_screen.selected_tag) 
        awful.screen.focus(new_screen)
    end)
)

    -- Mouse controls
keys.clientbuttons = gears.table.join(awful.button({}, 1, function(c) client.focus = c; c:raise() end),
    awful.button({mod}, 1, function() awful.mouse.client.move() end),
    awful.button({mod, "Shift"}, 1, function() awful.mouse.client.resize() end),
    awful.button({mod}, 3, function() awful.mouse.client.resize() end)
)

for i, t in ipairs(tags) do
    keys.globalkeys = gears.table.join(keys.globalkeys,
    awful.key({mod}, tostring(t.key), function()
        local tag = awful.screen.focused().tags[i]
        if tag then tag:view_only() end
    end), 
    
    -- Move window to tag
    awful.key({mod, 'Control'}, tostring(t.key), function()
        if client.focus then
            local tag = awful.screen.focused().tags[i]
            if tag then
                if client.focus then
                    client.focus:move_to_tag(tag)
                end
            end
        end
    end), 
    
    -- Move window to tag and view tag
    awful.key({mod, 'Shift'}, tostring(t.key), function()
        local tag = awful.screen.focused().tags[i]
        if tag then
            if client.focus then client.focus:move_to_tag(tag) end
            tag:view_only()
        end
    end))
end

for i = 1, 10 do
    keys.globalkeys = gears.table.join(keys.globalkeys,
    awful.key({mod, "Mod1"}, tostring(i % 10), function()
        local c = get_all_clients()[i]
        c:jump_to()
    end))
end

-- Set globalkeys
root.keys(keys.globalkeys)

return keys
