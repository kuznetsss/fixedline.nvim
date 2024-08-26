local has_copilot, copilot = pcall(require, 'copilot.client')
local empty = '   '

return {
  str = function(context)
    if not has_copilot then
      return empty
    end
    return copilot.buf_is_attached(context.buf_id) and ' %#FixedLine_Copilot# '
      or empty
  end,
}
