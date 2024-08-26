local M = {}

M.setup = function()
  vim.api.nvim_create_augroup('Fixedline', { clear = true })

  require('fixedline.highlights').define_default_highlights()

  vim.o.statusline = "%!v:lua.require'fixedline.line'.make_line()"

  local reload_line = function()
    for k, _ in pairs(package.loaded) do
      if type(k) == 'string' and k:find 'fixedline' then
        package.loaded[k] = nil
      end
    end
    require('fixedline').setup()
    vim.o.statusline = "%!v:lua.require'fixedline.line'.make_line()" --
  end
  vim.keymap.set('n', '<F9>', reload_line)

end

return M
