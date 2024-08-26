local cache = {}

local make_component = function(context)
    local readonly = vim.api.nvim_get_option_value(
        'readonly',
        { buf = context.buf_id }
    ) and '%#FixedLine_ReadOnly# RO' or ''

    local modifiable = vim.api.nvim_get_option_value(
        'modifiable',
        { buf = context.buf_id }
    ) and '' or '%#FixedLine_NoModifiable# NM'

    return string.format('%s%s', readonly, modifiable)
end

return {
    str = function(context)
        if not context.is_current and cache[context.buf_id] ~= nil then
            return cache[context.buf_id]
        end
        cache[context.buf_id] = make_component(context)
        return cache[context.buf_id]
    end,
}
