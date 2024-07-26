local M = {}

M.setup = function()
    vim.o.statusline = "%!v:lua.require'fixedline.line'.make_line()"

    local reload_line = function()
        for k, _ in pairs(package.loaded) do
            if type(k) == 'string' and k:find 'fixedline' then
                package.loaded[k] = nil
            end
        end
        vim.o.statusline = "%!v:lua.require'fixedline.line'.make_line()"
    end
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        pattern = { '*.lua' },
        callback = reload_line,
    })
    vim.keymap.set('n', '<F9>', reload_line)

    vim.api.nvim_create_augroup('Fixedline', { clear = true })
    vim.api.nvim_create_autocmd({ 'RecordingEnter' }, {
        callback = function()
            require('fixedline.components.recording_macro').recording_started(
                vim.fn.reg_recording()
            )
        end,
        group = 'Fixedline',
    })
    vim.api.nvim_create_autocmd({ 'RecordingLeave' }, {
        callback = function()
            require('fixedline.components.recording_macro').recording_finished()
        end,
        group = 'Fixedline',
    })
end

return M
