local ipairs = ipairs
local math = math


columns = {}
columns.name = "columns"
columns.default_cols_count = 3
columns.min_factor = 0.1

function columns.arrange(p)
    local wa = p.workarea
    local cls = p.clients
    local tg = p.tag or screen[p.screen].selected_tag

    -- Get global data
    local col_fact = awful.tag.getdata(tg).col_fact or {}
    local row_fact = awful.tag.getdata(tg).row_fact or {}
    local columns_table = awful.tag.getdata(tg).columns or {}

    local cols_data = {}
    local homeless = {}

    for i, c in ipairs(cls) do
        local c_col = columns_table[c]
        if c_col then 
            if not cols_data[c_col] then
                cols_data[c_col] = {}
            end
            cols_data[c_col] = gears.table.join(cols_data[c_col], {c})
        else
            homeless = gears.table.join(homeless, {c})
        end
    end

    -- Remove holes
    local cols_data2 = {}
    local col_fact2 = {}
    for i, k in ipairs(gears.table.keys(cols_data)) do
        cols_data2[i] = cols_data[k]
        col_fact2[i] = col_fact[k]
    end
    cols_data = cols_data2
    col_fact = col_fact2

    -- Create columns for homeless
    local cols = #cols_data
    cols = math.min(#cols_data + #homeless, columns.default_cols_count)
    for i=(#cols_data + 1), cols do
        cols_data[i] = {}
    end

    -- Add homeless to columns
    for _, c in ipairs(homeless) do
        local min = cols_data[1]
        for _, col in ipairs(cols_data) do
            if #col < #min then min = col end
        end
        table.insert(min, c)
    end

    -- Calc col factor sum
    local col_fact_sum = 0
    local col_offset = 0
    for col, col_data in pairs(cols_data) do
        col_fact_sum = col_fact_sum + (col_fact[col] or 1)
    end

    -- Place
    for col, col_data in ipairs(cols_data) do
        local rows = #col_data
        local cfact = (col_fact[col] or 1) / col_fact_sum
        local col_width = wa.width * cfact

        -- Calc row factor sum
        local row_fact_sum = 0
        local row_offset = 0
        for row, c in ipairs(col_data) do
            row_fact_sum = row_fact_sum + (row_fact[c] or 1)
        end
        for row, c in ipairs(col_data) do
            local g = {}
            local rfact = (row_fact[c] or 1) / row_fact_sum
            local row_width = wa.height * rfact
            g.height = math.ceil(row_width)
            g.width = math.ceil(col_width)
            g.y = row_offset
            g.x = col_offset
            g.y = g.y + wa.y
            g.x = g.x + wa.x
            row_offset = row_offset + row_width
            columns_table[c] = col
            p.geometries[c] = g
        end
        col_offset = col_offset + col_width
    end

    awful.tag.getdata(tg).columns = columns_table
end

function columns.change_col_relative(dir, c)
    c = c or awful.client.focus
    local tg = c.first_tag
    local columns_table = awful.tag.getdata(tg).columns
    if columns_table and columns_table[c] then
        columns_table[c] = columns_table[c] + dir
        tg:emit_signal("property::windowfact")
    end
end

function columns.inccfact(v, c)
    c = c or awful.client.focus
    local tg = c.first_tag
    local columns_table = awful.tag.getdata(tg).columns
    local col_fact = awful.tag.getdata(tg).col_fact
    if not col_fact then
        col_fact = {}
        awful.tag.getdata(tg).col_fact = col_fact
    end
    if columns_table and columns_table[c] then
        local col = columns_table[c]
        col_fact[col] = math.max((col_fact[col] or 1) + v, columns.min_factor)
        tg:emit_signal("property::windowfact")
    end
end

function columns.incrfact(v, c)
    c = c or awful.client.focus
    local tg = c.first_tag
    local row_fact = awful.tag.getdata(tg).row_fact
    if not row_fact then
        row_fact = {}
        awful.tag.getdata(tg).row_fact = row_fact
    end
    row_fact[c] = math.max((row_fact[c] or 1) + v, columns.min_factor)
    tg:emit_signal("property::windowfact")
end

function columns.normalize(tg)
    tg = tg or awful.screen.focused().selected_tag
    awful.tag.getdata(tg).col_fact = nil
    awful.tag.getdata(tg).row_fact = nil
    tg:emit_signal("property::windowfact")
end

function columns.drop(tg)
    tg = tg or awful.screen.focused().selected_tag
    columns.normalize(tg)
    awful.tag.getdata(tg).columns = nil
    tg:emit_signal("property::windowfact")
end

return columns
