local help = {}

help.rrect = function(rad)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, rad)
    end
end

help.fg = function(text, color)
    return "<span foreground='" .. color .. "'>" .. text .. "</span>"
end

help.strjoin = function(delimiter, list)
    local len = getn(list)
    if len == 0 then return "" end
    local string = list[1]
    for i = 2, len do string = string .. delimiter .. list[i] end
    return string
end

help.wrap = function(s, len)
    if #s > len - 1 then return s:sub(1, len - 1) .. "…" end
    return s
end

return help
