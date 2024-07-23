return {
    str = function()
        if vim.bo.modified then
            return ' +'
        end
        return '  '
    end
}
