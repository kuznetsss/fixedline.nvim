return {
  str = function()
    if vim.bo.modified then
      return ' %#FixedLine_BufferModified#󰆓'
    end
    return '  '
  end,
}
