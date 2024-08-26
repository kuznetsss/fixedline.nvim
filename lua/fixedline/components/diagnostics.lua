local utils = require 'fixedline.utils'
local empty = '      '

local get_diagnostic_count = function(sign, buf_id, severity, highlight)
  local count = #vim.diagnostic.get(buf_id, { severity = severity })
  return utils.count_to_string(sign, count, highlight)
end

return {
  empty = empty,
  str = function(context)
    return string.format(
      ' %s%s%s%s',
      get_diagnostic_count(
        ' ',
        context.buf_id,
        vim.diagnostic.severity.ERROR,
        'Fixedline_diagnostict_Error'
      ),
      get_diagnostic_count(
        ' ',
        context.buf_id,
        vim.diagnostic.severity.WARN,
        'Fixedline_diagnostict_Warning'
      ),
      get_diagnostic_count(
        ' ',
        context.buf_id,
        vim.diagnostic.severity.INFO,
        'Fixedline_diagnostict_Info'
      ),
      get_diagnostic_count(
        ' ',
        context.buf_id,
        vim.diagnostic.severity.HINT,
        'Fixedline_diagnostict_Hint'
      )
    )
  end,
}
