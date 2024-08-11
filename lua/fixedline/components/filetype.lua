local has_webdevicons, webdevicons = pcall(require, 'nvim-web-devicons')

return {
  str = function()
    local filetype = vim.bo.filetype
    local icon = (
      has_webdevicons and webdevicons.get_icon_by_filetype(filetype)
    ) or ''
    return string.format(' %%#Fixedline_Filetype#%s  %s', icon, filetype)
  end,
}
