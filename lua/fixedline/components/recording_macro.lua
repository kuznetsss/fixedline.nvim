local recording_register = nil

return {
    str = function()
        if recording_register then
            return string.format(' %s', recording_register)
        end
        return '   '
    end,
    recording_started = function(register)
        recording_register = register
    end,
    recording_finished = function()
        recording_register = nil
    end
}
