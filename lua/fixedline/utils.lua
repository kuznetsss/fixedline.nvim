return {
    get_buf_id = function(win_id)
        if not vim.api.nvim_win_is_valid(win_id) then
            return nil
        end
        return vim.api.nvim_win_get_buf(win_id)
    end,
    count_to_string = function(sign, count, highlight)
        highlight = highlight or 'StatusLine'
        if count == nil or count == 0 then
            return '    '
        end
        return string.format(' %%#%s#%s%d', highlight, sign, count)
    end,
}
