local has_webdevicons, webdevicons = pcall(require, 'nvim-web-devicons')

local get_filetype = function(buf_id)
    return vim.api.nvim_get_option_value('filetype', { buf = buf_id })
end

return {
    get_filetype = get_filetype,
    str = function(context)
        local filetype = get_filetype(context.buf_id)
        local icon = (
            has_webdevicons and webdevicons.get_icon_by_filetype(filetype)
        ) or ''
        return string.format(' %%#Fixedline_Filetype#%s  %s', icon, filetype)
    end,
}
