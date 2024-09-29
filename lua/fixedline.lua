local M = {}

M.reload = function()
  for k, _ in pairs(package.loaded) do
    if type(k) == 'string' and k:find 'fixedline' then
      package.loaded[k] = nil
    end
  end
  require('fixedline').setup()
end

M.setup = function()
  vim.api.nvim_create_augroup('Fixedline', { clear = true })

  require('fixedline.highlights').define_default_highlights()

  vim.o.statusline = "%!v:lua.require'fixedline.line'.make_line()"
end

return M
