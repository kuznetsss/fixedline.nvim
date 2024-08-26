return {
    str = function(context)
        if vim.api.nvim_get_option_value('modified', { buf = context.buf_id }) then
            return ' %#FixedLine_BufferModified#󰆓'
        end
        return '  '
    end,
}
