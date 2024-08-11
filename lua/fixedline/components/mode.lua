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

return {
  str = function()
    local mode = vim.fn.mode()
    local elements = modes_map[mode]
    return string.format('%%#%s#%s', elements.highlight, elements.str)
  end,
  get_highlight = function()
    local mode = vim.fn.mode()
    return string.format('%%#%s#', modes_map[mode].highlight)
  end,
}
