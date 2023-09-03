-- Importing libraries
gears = require('gears')
awful = require('awful')
wibox = require('wibox')
beautiful = require('beautiful')
dpi = beautiful.xresources.apply_dpi
layouts = require("layouts")

local home_path = os.getenv("HOME")
local wallpaper_path = home_path .. "/Pictures/wallpapers/"
function set_wallpaper()
    awful.spawn.with_shell(
        "find ~/Pictures/wallpapers -type f -name '*.jpg' -o -name '*.png' | shuf -n 1 | xargs -I {} feh --bg-fill {}")
end

local tag = function(name, key) return {name = name, key = key} end
-- tags = {
--   tag("0", "0"), tag("1", "1"), tag("2", "2"), tag("3", "3"), tag("4", "4"),
--   tag("5", "5"), tag("6", "6"), tag("7", "7"), tag("8", "8"), tag("9", "9")
-- }
-- tags = {
--     tag("I", "1"), tag("II", "2"), tag("III", "3"), tag("IV", "4"), tag("V", "5"),
--     tag("VI", "6"), tag("VII", "7"), tag("VIII", "8"), tag("IX", "9"), tag("X", "0")
-- }
tags = {
    tag("一", "1"), tag("二", "2"), tag("三", "3"), tag("四", "4"),
    tag("五", "5"), tag("六", "6"), tag("七", "7"), tag("八", "8"),
    tag("九", "9"), tag("零", "0"), tag("", "`")
}

beautiful.init('~/.config/awesome/theme/init.lua')
help = require('help')
sig = require('signals')
naughty = require("notifications")
keys = require('keys')

local req = {
    'bar', --'notifcenter',
    'rule', 'titlebar',
    'client', 'awful.autofocus'
}

for _, x in ipairs(req) do require(x) end

-- Layouts
awful.layout.layouts = {
    layouts.columns, awful.layout.suit.floating,
    awful.layout.suit.magnifier, awful.layout.suit.fair, awful.layout.suit.tile
}

-- Virtual desktops/ Tabs
awful.screen.connect_for_each_screen(function(s)
    tagTable = {}
    for i, t in ipairs(tags) do table.insert(tagTable, t.name) end
    awful.tag(tagTable, s, awful.layout.layouts[1])
end)

-- Autostart
set_wallpaper()

-- Garbage Collection
collectgarbage('setpause', 110)
collectgarbage('setstepmul', 1000)

naughty.resume()