return {
  str = function()
    local filetype = vim.bo.filetype
    local icon = require('nvim-web-devicons').get_icon_by_filetype(filetype)
      or ''
    return string.format('%s  %s', icon, filetype)
  end,
}
