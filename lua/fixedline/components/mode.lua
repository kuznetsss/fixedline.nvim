local modes_map = setmetatable({
  n = {
    str = ' NORMAL ',
    highlight = 'FixedLine_Mode_Normal',
  },
  v = {
    str = ' VISUAL ',
    highlight = 'FixedLine_Mode_Visual',
  },
  s = {
    str = ' SELECT ',
    highlight = 'FixedLine_Mode_Select',
  },
  i = {
    str = ' INSERT ',
    highlight = 'FixedLine_Mode_Insert',
  },
  R = {
    str = ' REPLACE ',
    highlight = 'FixedLine_Mode_Replace',
  },
  c = {
    str = ' COMMAN ',
    highlight = 'FixedLine_Mode_Command',
  },
  r = {
    str = ' PROMPT ',
    highlight = 'FixedLine_Mode_Prompt',
  },
  ['!'] = {
    str = ' SHELL ',
    highlight = 'FixedLine_Mode_Shell',
  },
  t = {
    str = ' TERMINAL ',
    highlight = 'FixedLine_Mode_Terminal',
  },
  [''] = {
    str = ' CTRL-V ',
    highlight = 'FixedLine_Mode_Ctrlv',
  },
}, {
  __index = function(_, key)
    return key
  end,
})

local get_mode = function(context)
    if context.is_current then
        return modes_map[vim.fn.mode()]
    end
    return modes_map.n
end

return {
  str = function(context)
    local mode = get_mode(context)
    return string.format('%%#%s#%s', mode.highlight, mode.str)
  end,
  get_highlight = function(context)
    local mode = get_mode(context)
    return string.format('%%#%s#', mode.highlight)
  end,
}
