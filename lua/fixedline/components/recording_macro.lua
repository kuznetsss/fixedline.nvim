local recording_register = nil

vim.api.nvim_create_autocmd({ 'RecordingEnter' }, {
    callback = function()
        recording_register = vim.fn.reg_recording()
    end,
    group = 'Fixedline',
})

vim.api.nvim_create_autocmd({ 'RecordingLeave' }, {
    callback = function()
        recording_register = nil
    end,
    group = 'Fixedline',
})

return {
    str = function()
        if recording_register then
            return string.format(
                '%%#FixedLine_RecordingMacro# %s',
                recording_register
            )
        end
        return '   '
    end,
}
