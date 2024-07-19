return {
    str = function()
        if vim.bo.readonly then
            return ' RO'
        end
        return ''
    end
}
