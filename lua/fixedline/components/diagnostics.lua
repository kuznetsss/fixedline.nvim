local utils = require'fixedline.utils'
local empty = '      '

local get_diagnostic_count = function(sign, buf_id, severity)
    local count = #vim.diagnostic.get(buf_id, { severity = severity })
    return utils.count_to_string(sign, count)
end

return {
    empty = empty,
    str = function(win_id)
        local buf_id = utils.get_buf_id(win_id)
        return string.format(
            ' %s%s%s%s',
            get_diagnostic_count(' ', buf_id, vim.diagnostic.severity.ERROR),
            get_diagnostic_count(' ', buf_id, vim.diagnostic.severity.WARN),
            get_diagnostic_count(' ', buf_id, vim.diagnostic.severity.INFO),
            get_diagnostic_count(' ', buf_id, vim.diagnostic.severity.HINT)
        )
    end,
}
