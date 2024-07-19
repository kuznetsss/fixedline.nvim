local empty = '      '

local get_diagnostic_count = function(sign, buf_id, severity)
    local count = #vim.diagnostic.get(buf_id, { severity = severity })
    if count == 0 then
        return '   '
    end
    return string.format('%s%d', sign, count)
end

return {
    empty = empty,
    str = function(win_id)
        if not vim.api.nvim_win_is_valid(win_id) then
            return empty
        end
        local buf_id = vim.api.nvim_win_get_buf(win_id)
        return string.format(
            '%s %s %s %s',
            get_diagnostic_count(' ', buf_id, vim.diagnostic.severity.ERROR),
            get_diagnostic_count(' ', buf_id, vim.diagnostic.severity.WARN),
            get_diagnostic_count(' ', buf_id, vim.diagnostic.severity.INFO),
            get_diagnostic_count(' ', buf_id, vim.diagnostic.severity.HINT)
        )
    end,
}
