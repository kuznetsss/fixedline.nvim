local toString = function(sign, value)
  if not value or value == 0 then
    return '   '
  end
  return string.format('%s%d', sign, value)
end

return {
  str = function()
    local diff = vim.b.gitsigns_status_dict
    if not diff then
      return '           '
    end
    return string.format(
      ' %s %s %s ',
      toString(' ', diff.added),
      toString(' ', diff.changed),
      toString(' ', diff.removed)
    )
  end,
}
