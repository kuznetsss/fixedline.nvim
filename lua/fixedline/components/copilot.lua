local utils = require'fixedline.utils'

local has_copilot, copilot = pcall(require, 'copilot.client')
local empty = '   '

return {
    str = function(win_id)
        if not has_copilot then
            return empty
        end
        local buf_id = utils.get_buf_id(win_id)
        return copilot.buf_is_attached(buf_id) and '  ' or empty
    end
}
