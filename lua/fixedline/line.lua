local components = require 'fixedline.components'

local make_active = function(win_id)
    return table.concat {
        components.mode.str(),
        components.ro.str(),
        '%#FixedLine_Filename# %t ',
        components.modified.str(),
        components.git.str(),
        '%#StatusLine#%=',
        components.recording_macro.str(),
        components.copilot.str(win_id),
        '  ',
        components.diagnostic.str(win_id),
        '  ',
        components.filetype.str(),
        ' ',
        components.mode.get_highlight(),
        ' %l:%c | %p%% ',
    }
end

local cache = {}

return {
    make_line = function()
        local win_id = vim.g.statusline_winid
        if win_id == vim.api.nvim_get_current_win() then
            local line = make_active(win_id)
            cache[win_id] = line
            return line
        end
        return cache[win_id] or make_active(win_id)
    end,
}
