local components = require'fixedline.components'

local make_active = function(win_id)
  return table.concat {
    components.mode.str(),
    components.ro.str(),
    ' %t ',
    components.modified.str(),
    components.git.str(),
    '%=',
    components.diagnostic.str(win_id),
    '    ',
    components.filetype.str(),
    '  %l : %c | %p%% ',
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
