local count_to_string = require('fixedline.utils').count_to_string

return {
  str = function(context)
    local has_diff, diff = pcall(vim.api.nvim_buf_get_var, context.buf_id, 'gitsigns_status_dict')
    if not has_diff or not diff then
      return ''
    end
    return string.format(
      ' %s%s%s',
      count_to_string(' ', diff.added, 'Fixedline_Git_Added'),
      count_to_string(' ', diff.changed, 'Fixedline_Git_Changed'),
      count_to_string('󰍴 ', diff.removed, 'Fixedline_Git_Removed')
    )
  end,
}
