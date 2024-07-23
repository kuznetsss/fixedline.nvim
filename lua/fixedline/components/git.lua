local count_to_string = require'fixedline.utils'.count_to_string

return {
  str = function()
    local diff = vim.b.gitsigns_status_dict
    if not diff then
      return ''
    end
    return string.format(
      ' %s%s%s',
      count_to_string(' ', diff.added),
      count_to_string(' ', diff.changed),
      count_to_string(' ', diff.removed)
    )
  end,
}
