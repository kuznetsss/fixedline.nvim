local mode = require'fixedline.components.mode'
local ro = require'fixedline.components.readonly'
local modified = require'fixedline.components.buffer_modified'
local filetype = require'fixedline.components.filetype'
local M = {}

local make_active = function()
    return table.concat({
        mode.str(),
        ro.str(),
        ' %.30f ',
        modified.str(),
        '%=',
        filetype.str(),
        '  %l : %c | %p%% '
    })
end

local cache = {};

function M.make_line()
    local win_id = vim.g.statusline_winid
    if win_id == vim.api.nvim_get_current_win() then
        local line = make_active()
        cache[win_id] = line
        return line
    end
    return cache[win_id] or make_active()
end


return M
