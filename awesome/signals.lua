local M = {}

local scripts = require("gears.filesystem").get_configuration_dir() ..
                    "/awesome-scripts/"

local killall = scripts .. "killall.sh"
local vol = scripts .. "volume.sh"
local net = scripts .. "net.sh"
local blue = scripts .. "bluetooth.sh"
local fd = scripts .. "fd.sh"
local mem = scripts .. "mem.sh"
local cpu = scripts .. "cpu.sh"
local bat = scripts .. "bat.sh"

kill_processes = function() 
    os.execute(killall)
end

kill_processes()

M.vol = awful.spawn.with_line_callback(vol, {
    stdout = function(out)
        local val = gears.string.split(out, "\t")
        awesome.emit_signal('vol::value', val[1] == "true", tonumber(val[2]))
    end
})

M.net = awful.spawn.with_line_callback(net, {
    stdout = function(out)
        local val = gears.string.split(out, "\t")
        awesome.emit_signal('net::value', tonumber(val[1]), val[2])
    end
})

M.mem = function()
    awful.spawn.easy_async_with_shell(mem, function(out)
        awesome.emit_signal('mem::value', tonumber(out))
    end)
end

M.fd = function()
    awful.spawn.easy_async_with_shell(fd, function(out)
        local val = gears.string.split(out, "\t")
        awesome.emit_signal('fd::value', val[1], val[2])
    end)
end

M.blu = function()
    awful.spawn.easy_async_with_shell(blue, function(out)
        local val = gears.string.split(out, "\t")
        awesome.emit_signal('blu::value', val[2], val[1])
    end)
end

M.bat = function()
    awful.spawn.easy_async_with_shell(bat, function(out)
        local val = gears.string.split(out, "\t")
        awesome.emit_signal('bat::value', tonumber(val[1]), val[2])
    end)
end

gears.timer {
    timeout = 5,
    call_now = true,
    autostart = true,
    callback = function()
        -- M.blu()
        -- M.mem()
        M.bat()
        -- M.fd()
    end
}

return M
