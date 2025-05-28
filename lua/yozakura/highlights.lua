local M = {}

function M.setup(palette)
  local hl = {}
  
  -- Editor highlights
  hl.Normal = { fg = palette.fg0, bg = palette.bg0 }
  hl.NormalFloat = { fg = palette.fg0, bg = palette.bg1 }
  hl.FloatBorder = { fg = palette.sakura_muted, bg = palette.bg1 }
  hl.ColorColumn = { bg = palette.bg1 }
  hl.Cursor = { fg = palette.bg0, bg = palette.sakura }
  hl.CursorLine = { bg = palette.bg1 }
  hl.CursorLineNr = { fg = palette.sakura, bg = palette.bg1 }
  hl.LineNr = { fg = palette.fg3 }
  hl.SignColumn = { fg = palette.fg3, bg = palette.bg0 }
  hl.VertSplit = { fg = palette.bg2 }
  hl.EndOfBuffer = { fg = palette.bg2 }
  hl.Folded = { fg = palette.fg2, bg = palette.bg1 }
  hl.FoldColumn = { fg = palette.fg3, bg = palette.bg0 }
  
  -- Statusline
  hl.StatusLine = { fg = palette.fg1, bg = palette.bg2 }
  hl.StatusLineNC = { fg = palette.fg3, bg = palette.bg1 }
  
  -- Pmenu
  hl.Pmenu = { fg = palette.fg1, bg = palette.bg1 }
  hl.PmenuSel = { fg = palette.bg0, bg = palette.sakura }
  hl.PmenuSbar = { bg = palette.bg2 }
  hl.PmenuThumb = { bg = palette.sakura_muted }
  
  -- Search
  hl.Search = { fg = palette.bg0, bg = palette.sakura_light }
  hl.IncSearch = { fg = palette.bg0, bg = palette.sakura }
  hl.CurSearch = { fg = palette.bg0, bg = palette.sakura }
  
  -- Visual
  hl.Visual = { bg = palette.bg3 }
  hl.VisualNOS = { bg = palette.bg3 }
  
  -- Diff
  hl.DiffAdd = { fg = palette.green, bg = palette.bg1 }
  hl.DiffChange = { fg = palette.yellow, bg = palette.bg1 }
  hl.DiffDelete = { fg = palette.red, bg = palette.bg1 }
  hl.DiffText = { fg = palette.bg0, bg = palette.yellow }
  
  -- Syntax
  hl.Comment = { fg = palette.fg3, italic = true }
  hl.Constant = { fg = palette.orange }
  hl.String = { fg = palette.cyan }
  hl.Character = { fg = palette.cyan }
  hl.Number = { fg = palette.orange }
  hl.Boolean = { fg = palette.orange }
  hl.Float = { fg = palette.orange }
  
  hl.Identifier = { fg = palette.fg0 }
  hl.Function = { fg = palette.sakura }
  
  hl.Statement = { fg = palette.sakura_dark }
  hl.Conditional = { fg = palette.sakura_dark }
  hl.Repeat = { fg = palette.sakura_dark }
  hl.Label = { fg = palette.sakura_dark }
  hl.Operator = { fg = palette.fg1 }
  hl.Keyword = { fg = palette.sakura_dark }
  hl.Exception = { fg = palette.red }
  
  hl.PreProc = { fg = palette.purple }
  hl.Include = { fg = palette.purple }
  hl.Define = { fg = palette.purple }
  hl.Macro = { fg = palette.purple }
  hl.PreCondit = { fg = palette.purple }
  
  hl.Type = { fg = palette.blue }
  hl.StorageClass = { fg = palette.blue }
  hl.Structure = { fg = palette.blue }
  hl.Typedef = { fg = palette.blue }
  
  hl.Special = { fg = palette.sakura_light }
  hl.SpecialChar = { fg = palette.sakura_light }
  hl.Tag = { fg = palette.sakura_light }
  hl.Delimiter = { fg = palette.fg1 }
  hl.SpecialComment = { fg = palette.fg2, italic = true }
  hl.Debug = { fg = palette.red }
  
  hl.Underlined = { underline = true }
  hl.Ignore = { fg = palette.fg3 }
  hl.Error = { fg = palette.red }
  hl.Todo = { fg = palette.yellow, bold = true }
  
  -- Diagnostic
  hl.DiagnosticError = { fg = palette.red }
  hl.DiagnosticWarn = { fg = palette.yellow }
  hl.DiagnosticInfo = { fg = palette.blue }
  hl.DiagnosticHint = { fg = palette.cyan }
  
  -- Git
  hl.GitSignsAdd = { fg = palette.green }
  hl.GitSignsChange = { fg = palette.yellow }
  hl.GitSignsDelete = { fg = palette.red }
  
  -- Treesitter
  hl["@variable"] = { fg = palette.fg0 }
  hl["@variable.builtin"] = { fg = palette.purple }
  hl["@variable.parameter"] = { fg = palette.fg1 }
  hl["@variable.member"] = { fg = palette.fg0 }
  hl["@constant"] = { fg = palette.orange }
  hl["@constant.builtin"] = { fg = palette.orange }
  hl["@constant.macro"] = { fg = palette.orange }
  hl["@string"] = { fg = palette.cyan }
  hl["@string.regex"] = { fg = palette.cyan }
  hl["@string.escape"] = { fg = palette.sakura_light }
  hl["@character"] = { fg = palette.cyan }
  hl["@number"] = { fg = palette.orange }
  hl["@boolean"] = { fg = palette.orange }
  hl["@function"] = { fg = palette.sakura }
  hl["@function.builtin"] = { fg = palette.sakura }
  hl["@function.macro"] = { fg = palette.purple }
  hl["@method"] = { fg = palette.sakura }
  hl["@constructor"] = { fg = palette.sakura }
  hl["@parameter"] = { fg = palette.fg1 }
  hl["@keyword"] = { fg = palette.sakura_dark }
  hl["@keyword.function"] = { fg = palette.sakura_dark }
  hl["@keyword.operator"] = { fg = palette.sakura_dark }
  hl["@keyword.return"] = { fg = palette.sakura_dark }
  hl["@conditional"] = { fg = palette.sakura_dark }
  hl["@repeat"] = { fg = palette.sakura_dark }
  hl["@label"] = { fg = palette.sakura_dark }
  hl["@operator"] = { fg = palette.fg1 }
  hl["@exception"] = { fg = palette.red }
  hl["@type"] = { fg = palette.blue }
  hl["@type.builtin"] = { fg = palette.blue }
  hl["@structure"] = { fg = palette.blue }
  hl["@include"] = { fg = palette.purple }
  hl["@punctuation.delimiter"] = { fg = palette.fg1 }
  hl["@punctuation.bracket"] = { fg = palette.fg1 }
  hl["@punctuation.special"] = { fg = palette.sakura_light }
  hl["@comment"] = { fg = palette.fg3, italic = true }
  hl["@tag"] = { fg = palette.sakura_light }
  hl["@tag.delimiter"] = { fg = palette.fg1 }
  hl["@text"] = { fg = palette.fg0 }
  hl["@text.emphasis"] = { italic = true }
  hl["@text.strong"] = { bold = true }
  
  return hl
end

return M