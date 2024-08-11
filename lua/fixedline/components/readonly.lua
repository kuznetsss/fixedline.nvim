return {
  str = function()
    local readonly = vim.bo.readonly and '%#FixedLine_ReadOnly# RO' or ''
    local modifiable = vim.bo.modifiable and ''
      or '%#FixedLine_NoModifiable# NM'

    return string.format('%s%s', readonly, modifiable)
  end,
}
