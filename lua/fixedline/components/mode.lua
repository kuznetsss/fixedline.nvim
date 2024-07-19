local modes_map = setmetatable({
  n = ' NORMAL',
  v = ' VISUAL',
  s = ' SELECT',
  i = ' INSERT',
  R = ' REPLACE',
  c = ' COMMAND',
  r = ' PROMPT',
  ['!'] = ' SHELL',
  t = ' TERMINAL',
  [''] = ' CTRL-V',
}, {
  __index = function(_, key)
    return key
  end,
})

return {
  str = function()
    local mode = vim.fn.mode()
    return modes_map[mode]
  end,
}
