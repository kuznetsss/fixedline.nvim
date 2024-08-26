local components = require 'fixedline.components'

local make_line = function()
    local win_id = vim.g.statusline_winid
    local context = {
        win_id = win_id,
        buf_id = vim.api.nvim_win_get_buf(win_id),
        is_current = win_id == vim.api.nvim_get_current_win()
    }
  return table.concat {
    components.mode.str(context),
    components.ro.str(context),
    '%#FixedLine_Filename# %t ',
    components.modified.str(context),
    components.git.str(context),
    '%#StatusLine#%=',
    components.recording_macro.str(),
    components.copilot.str(context),
    '  ',
    components.diagnostic.str(context),
    '  ',
    components.filetype.str(context),
    ' ',
    components.mode.get_highlight(context),
    ' %l:%c | %p%% ',
  }
end

return {
  make_line = make_line
}
