local utils = require 'fixedline.utils'
local empty = '      '

local get_diagnostic_count = function(sign, buf_id, severity, highlight)
  local count = #vim.diagnostic.get(buf_id, { severity = severity })
  return utils.count_to_string(sign, count, highlight)
end

return {
  empty = empty,
  str = function(win_id)
    local buf_id = utils.get_buf_id(win_id)
    return string.format(
      ' %s%s%s%s',
      get_diagnostic_count(
        ' ',
        buf_id,
        vim.diagnostic.severity.ERROR,
        'Fixedline_diagnostict_Error'
      ),
      get_diagnostic_count(
        ' ',
        buf_id,
        vim.diagnostic.severity.WARN,
        'Fixedline_diagnostict_Warning'
      ),
      get_diagnostic_count(
        ' ',
        buf_id,
        vim.diagnostic.severity.INFO,
        'Fixedline_diagnostict_Info'
      ),
      get_diagnostic_count(
        ' ',
        buf_id,
        vim.diagnostic.severity.HINT,
        'Fixedline_diagnostict_Hint'
      )
    )
  end,
}
