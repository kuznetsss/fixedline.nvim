local default_highlights = {
  FixedLine_Mode_Normal = { bg = 'Folded', bold = true },
  FixedLine_Mode_Visual = { bg = 'Visual', bold = true },
  FixedLine_Mode_Select = { bg = 'Visual', bold = true },
  FixedLine_Mode_Insert = { bg = 'DiffAdd', bold = true },
  FixedLine_Mode_Replace = {
    bg = 'DiffDelete',
    bold = true,
  },
  FixedLine_Mode_Command = {
    fg = 'Statement',
    bold = true,
    reverse = true,
  },
  FixedLine_Mode_Prompt = {
    fg = '@parameter',
    bold = true,
  },
  FixedLine_Mode_Shell = { fg = '@property', bold = true, reverse = true },
  FixedLine_Mode_Terminal = { fg = '@field', bold = true, reverse = true },
  FixedLine_Mode_Ctrlv = { bg = 'Visual', bold = true },
  FixedLine_ReadOnly = { fg = 'DiagnosticWarn' },
  FixedLine_NoModifiable = { fg = 'DiagnosticError' },
  FixedLine_BufferModified = { fg = 'Identifier', bold = true },
  FixedLine_Filename = { link = 'StatusLine' },
  Fixedline_Git_Added = { fg = 'GitSignsAdd' },
  Fixedline_Git_Changed = { fg = 'GitSignsChange' },
  Fixedline_Git_Removed = { fg = 'GitSignsDelete' },
  FixedLine_RecordingMacro = { fg = 'Constant' },
  FixedLine_Copilot = { fg = 'Statement' },
  Fixedline_diagnostict_Error = { fg = 'DiagnosticError' },
  Fixedline_diagnostict_Warning = { fg = 'DiagnosticWarn' },
  Fixedline_diagnostict_Info = { fg = 'DiagnosticInfo' },
  Fixedline_diagnostict_Hint = { fg = 'DiagnosticHint' },
  Fixedline_Filetype = { fg = 'Keyword' },
  FixedLine_Position = { bg = 'StatusLine' },
}

local get_hl_options = function(name)
  return vim.api.nvim_get_hl(0, { name = name, link = false })
end

local make_highlight_options = function(p)
  return {
    fg = get_hl_options(p.fg).fg,
    bg = get_hl_options(p.bg or 'StatusLine').bg,
    bold = p.bold,
    link = p.link,
    reverse = p.reverse,
  }
end

return {
  define_default_highlights = function()
    for highlight, default in pairs(default_highlights) do
      vim.api.nvim_set_hl(0, highlight, make_highlight_options(default))
    end
  end,
}
