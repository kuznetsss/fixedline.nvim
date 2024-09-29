return {
  count_to_string = function(sign, count, highlight)
    highlight = highlight or 'StatusLine'
    if count == nil or count == 0 then
      return '    '
    end
    return string.format(' %%#%s#%s%d', highlight, sign, count)
  end,
  async_redraw_all_lines = function()
    vim.schedule(function()
      vim.cmd 'redrawstatus!'
    end)
  end,
}
