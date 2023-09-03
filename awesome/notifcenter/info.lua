local M = {}

-- Wifi
M.net = wibox.widget {
  font = beautiful.iconfont,
  align = 'center',
  widget = wibox.widget.textbox,
}

local net_icon = {
    [0] = "?",
    [10] = "󰤮",
    [20] = "󰤯",
    [30] = "󱛆",
    [40] = "󱛆",
    [50] = "󱚼",
    [60] = "󱚵",
    [70] = "󰖩",
}

awesome.connect_signal("net::value", function(stateId, name)
    M.net.markup = net_icon[stateId] .. "\n" .. tostring(name)
end)

-- Bluethooth
M.blu = wibox.widget {
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
    M.blu.markup = M.blu.markup .. "\n" .. name
  -- end
end)

return M
