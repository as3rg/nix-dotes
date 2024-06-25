local M = {}

-- Wifi
M.net = wibox.widget {
  font = beautiful.iconfont,
  align = 'center',
  widget = wibox.widget.textbox,
}

-- Bluethooth
M.blu = wibox.widget {
  font = beautiful.iconfont,
  align = 'center',
  widget = wibox.widget.textbox,
}

-- Memory
M.mem = wibox.widget {
  font = beautiful.iconfont,
  align = 'center',
  widget = wibox.widget.textbox,
}

-- Disk usage
M.fd = wibox.widget {
  font = beautiful.iconfont,
  align = 'center',
  widget = wibox.widget.textbox,
}

awesome.connect_signal("blu::value", function(stat, name)
  if stat:match("no") then
    M.blu.markup = "󰂲"
  else
    M.blu.markup = "󰂯"
  end
  -- if count > 0 then
    M.blu.markup = M.blu.markup .. " " .. name
  -- end
end)

awesome.connect_signal("net::value", function(stat, name)
  if stat then
    M.net.markup = "󰖩"
  else
    M.net.markup = "󰤯"
  end
  M.net.markup = M.net.markup .. " " .. name
end)

awesome.connect_signal("mem::value", function(memu)
  M.mem.markup = " " .. memu .. "M"
end)

awesome.connect_signal("fd::value", function(used, total)
  M.fd.markup = "🖴 " .. used .. "/" .. total
end)

return M
