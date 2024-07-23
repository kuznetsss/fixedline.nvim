return {
    str = function()
        local readonly = vim.bo.readonly and ' RO' or ''
        local modifiable = vim.bo.modifiable and '' or ' NM'

        return string.format('%s%s', readonly, modifiable)
    end
}
