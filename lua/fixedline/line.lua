local components = require 'fixedline.components'

local make_regular_line = function(context)
    return table.concat {
        components.mode.str(context),
        components.ro.str(context),
        '%#FixedLine_Filename# %t ',
        components.modified.str(context),
        components.git.str(context),
        '%#StatusLine#%=%<',
        components.recording_macro.str(),
        components.copilot.str(context),
        '  ',
        components.diagnostic.str(context),
        '  ',
        components.filetype.str(context),
        ' ',
        components.mode.get_highlight(context),
        components.position.str(),
    }
end

local make_quickfix_line = function(context)
    local get_title = function()
        local title = vim.fn.getqflist({ title = 0 }).title
        if string.len(title) == 0 then
            return ''
        end
        return string.format('[%s]', title)
    end

    return table.concat {
        components.mode.str(context),
        '%#FixedLine_Filetype# Quickfix %#FixedLine_Filename#',
        get_title(),
        '%#StatusLine#%=',
        components.mode.get_highlight(context),
        components.position.str(),
    }
end

local make_left_win_lihe = function(name)
    return function(context)
        return table.concat {
            '%#FixedLine_Filetype# ',
            name,
            '%#StatusLine#%=',
            components.mode.get_highlight(context),
            components.position.str(),
        }
    end
end

local make_toggleterm_line = function(context)
    local process_name =
        vim.api.nvim_buf_get_name(context.buf_id):match ':.*:(.*);'
    return table.concat {
        components.mode.str(context),
        components.ro.str(context),
        ' %#FixedLine_Filetype# Terminal',
        string.format(
            ' %%#FixedLine_Filename#[%d] %s',
            vim.api.nvim_buf_get_var(context.buf_id, 'toggle_number'),
            process_name
        ),
        '%#StatusLine#%=',
        components.mode.get_highlight(context),
        components.position.str(),
    }
end

local line_for = setmetatable({
    qf = make_quickfix_line,
    NvimTree = make_left_win_lihe('NvimTree'),
    toggleterm = make_toggleterm_line,
    DiffviewFiles = make_left_win_lihe('DiffviewFiles'),
}, {
    __index = function()
        return make_regular_line
    end,
})

local make_line = function()
    local win_id = vim.g.statusline_winid
    local context = {
        win_id = win_id,
        buf_id = vim.api.nvim_win_get_buf(win_id),
        is_current = win_id == vim.api.nvim_get_current_win(),
    }
    local filetype = components.filetype.get_filetype(context.buf_id)
    return line_for[filetype](context)
end

return {
    make_line = make_line,
}
