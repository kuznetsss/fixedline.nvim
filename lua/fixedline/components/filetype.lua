local has_webdevicons, webdevicons = pcall(require, 'nvim-web-devicons')

return {
    str = function(context)
        local filetype =
            vim.api.nvim_get_option_value('filetype', { buf = context.buf_id })
        local icon = (
            has_webdevicons and webdevicons.get_icon_by_filetype(filetype)
        ) or ''
        return string.format(' %%#Fixedline_Filetype#%s  %s', icon, filetype)
    end,
}
