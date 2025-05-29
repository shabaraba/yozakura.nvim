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
  
  -- Treesitter (updated for Neovim 0.9+)
  -- Get palette name from config
  local config = require("yozakura.config").get()
  local palette_name = config.palette or "soft_contrast"
  
  -- Variables - different mappings per palette
  if palette_name == "soft_contrast" then
    hl["@variable"] = { fg = palette.sakura_muted } -- #a888a1
    hl["@variable.builtin"] = { fg = palette.purple }
    hl["@variable.parameter"] = { fg = palette.fg1 }
    hl["@variable.member"] = { fg = palette.fg0 }
  elseif palette_name == "warm_gray" then
    hl["@variable"] = { fg = palette.sakura_muted } -- #b08a95
    hl["@variable.builtin"] = { fg = palette.purple }
    hl["@variable.parameter"] = { fg = palette.fg1 }
    hl["@variable.member"] = { fg = palette.fg0 }
  elseif palette_name == "muted_rose" then
    hl["@variable"] = { fg = palette.sakura_muted } -- #a08590
    hl["@variable.builtin"] = { fg = palette.purple }
    hl["@variable.parameter"] = { fg = palette.fg1 }
    hl["@variable.member"] = { fg = palette.fg0 }
  elseif palette_name == "night_blue" then
    hl["@variable"] = { fg = palette.sakura_muted } -- #9d88a5
    hl["@variable.builtin"] = { fg = palette.purple } -- #bb9af7
    hl["@variable.parameter"] = { fg = palette.fg1 }
    hl["@variable.member"] = { fg = palette.blue } -- #7aa2f7
  end
  
  -- Constants
  hl["@constant"] = { fg = palette.orange }
  hl["@constant.builtin"] = { fg = palette.orange }
  hl["@constant.macro"] = { fg = palette.orange }
  
  -- Strings - different mappings per palette
  if palette_name == "soft_contrast" then
    hl["@string"] = { fg = palette.sakura_light } -- #d9b8cf
    hl["@string.documentation"] = { fg = palette.sakura_light }
    hl["@string.regex"] = { fg = palette.sakura_light }
    hl["@string.escape"] = { fg = palette.sakura }
    hl["@string.special"] = { fg = palette.sakura }
    hl["@string.special.symbol"] = { fg = palette.orange }
    hl["@string.special.url"] = { fg = palette.blue, underline = true }
  elseif palette_name == "warm_gray" then
    hl["@string"] = { fg = palette.sakura_light } -- #e0b5c5
    hl["@string.documentation"] = { fg = palette.sakura_light }
    hl["@string.regex"] = { fg = palette.sakura_light }
    hl["@string.escape"] = { fg = palette.sakura }
    hl["@string.special"] = { fg = palette.sakura }
    hl["@string.special.symbol"] = { fg = palette.orange }
    hl["@string.special.url"] = { fg = palette.blue, underline = true }
  elseif palette_name == "muted_rose" then
    hl["@string"] = { fg = palette.sakura_light } -- #d6b5c0
    hl["@string.documentation"] = { fg = palette.sakura_light }
    hl["@string.regex"] = { fg = palette.red } -- #d5889c (special for muted_rose)
    hl["@string.escape"] = { fg = palette.sakura }
    hl["@string.special"] = { fg = palette.sakura }
    hl["@string.special.symbol"] = { fg = palette.orange }
    hl["@string.special.url"] = { fg = palette.blue, underline = true }
  elseif palette_name == "night_blue" then
    hl["@string"] = { fg = palette.sakura_light } -- #e0c0d5
    hl["@string.documentation"] = { fg = palette.sakura_light }
    hl["@string.regex"] = { fg = palette.red } -- #f7768e
    hl["@string.escape"] = { fg = palette.sakura }
    hl["@string.special"] = { fg = palette.green } -- #9ece6a
    hl["@string.special.symbol"] = { fg = palette.orange }
    hl["@string.special.url"] = { fg = palette.blue, underline = true }
  end
  
  -- Characters - different mappings per palette
  if palette_name == "soft_contrast" then
    hl["@character"] = { fg = palette.sakura_light } -- Same as string
    hl["@character.special"] = { fg = palette.sakura }
  elseif palette_name == "warm_gray" then
    hl["@character"] = { fg = palette.sakura_light } -- Same as string
    hl["@character.special"] = { fg = palette.sakura }
  elseif palette_name == "muted_rose" then
    hl["@character"] = { fg = palette.sakura_light } -- Same as string
    hl["@character.special"] = { fg = palette.sakura }
  elseif palette_name == "night_blue" then
    hl["@character"] = { fg = palette.sakura_light } -- Same as string
    hl["@character.special"] = { fg = palette.sakura }
  else
    hl["@character"] = { fg = palette.cyan }
    hl["@character.special"] = { fg = palette.sakura_light }
  end
  
  -- Numbers - different mappings per palette
  if palette_name == "warm_gray" then
    hl["@number"] = { fg = palette.sakura_light } -- Use sakura_light for warm_gray
    hl["@number.float"] = { fg = palette.sakura_light }
  elseif palette_name == "muted_rose" then
    hl["@number"] = { fg = palette.sakura_light } -- Use sakura_light for muted_rose
    hl["@number.float"] = { fg = palette.sakura_light }
  elseif palette_name == "night_blue" then
    hl["@number"] = { fg = palette.sakura_light } -- Use sakura_light for night_blue
    hl["@number.float"] = { fg = palette.sakura_light }
  else
    hl["@number"] = { fg = palette.orange }
    hl["@number.float"] = { fg = palette.orange }
  end
  
  -- Booleans - different mappings per palette
  if palette_name == "warm_gray" then
    hl["@boolean"] = { fg = palette.sakura } -- #d5a0b5
  elseif palette_name == "muted_rose" then
    hl["@boolean"] = { fg = palette.sakura } -- #c79fad
  elseif palette_name == "night_blue" then
    hl["@boolean"] = { fg = palette.sakura_dark } -- #c090b8
  else
    hl["@boolean"] = { fg = palette.orange }
  end
  
  -- Functions - different mappings per palette
  if palette_name == "soft_contrast" then
    hl["@function"] = { fg = palette.sakura } -- #cba6c3
    hl["@function.builtin"] = { fg = palette.sakura_dark } -- #c386b8
    hl["@function.call"] = { fg = palette.sakura }
    hl["@function.macro"] = { fg = palette.purple }
    hl["@function.method"] = { fg = palette.sakura }
    hl["@function.method.call"] = { fg = palette.sakura }
  elseif palette_name == "warm_gray" then
    hl["@function"] = { fg = palette.sakura } -- #d5a0b5
    hl["@function.builtin"] = { fg = palette.sakura_dark } -- #cc8fa5
    hl["@function.call"] = { fg = palette.sakura }
    hl["@function.macro"] = { fg = palette.purple }
    hl["@function.method"] = { fg = palette.sakura }
    hl["@function.method.call"] = { fg = palette.sakura }
  elseif palette_name == "muted_rose" then
    hl["@function"] = { fg = palette.sakura } -- #c79fad
    hl["@function.builtin"] = { fg = palette.sakura_dark } -- #b88a9a
    hl["@function.call"] = { fg = palette.sakura }
    hl["@function.macro"] = { fg = palette.purple }
    hl["@function.method"] = { fg = palette.sakura }
    hl["@function.method.call"] = { fg = palette.sakura }
  elseif palette_name == "night_blue" then
    hl["@function"] = { fg = palette.sakura } -- #d0a5c8
    hl["@function.builtin"] = { fg = palette.blue } -- #7aa2f7
    hl["@function.call"] = { fg = palette.sakura }
    hl["@function.macro"] = { fg = palette.purple } -- #bb9af7
    hl["@function.method"] = { fg = palette.sakura_light } -- #e0c0d5
    hl["@function.method.call"] = { fg = palette.sakura_light }
  end
  
  -- Methods
  hl["@method"] = { fg = palette.sakura }
  hl["@method.call"] = { fg = palette.sakura }
  
  -- Constructors - different mappings per palette
  if palette_name == "warm_gray" then
    hl["@constructor"] = { fg = palette.sakura_dark } -- #cc8fa5
  elseif palette_name == "muted_rose" then
    hl["@constructor"] = { fg = palette.sakura_dark } -- #b88a9a
  elseif palette_name == "night_blue" then
    hl["@constructor"] = { fg = palette.sakura } -- #d0a5c8
  else
    hl["@constructor"] = { fg = palette.sakura }
  end
  
  -- Parameters
  hl["@parameter"] = { fg = palette.fg1 }
  hl["@parameter.reference"] = { fg = palette.fg1 }
  
  -- Keywords - different mappings per palette
  if palette_name == "soft_contrast" then
    hl["@keyword"] = { fg = palette.sakura_dark } -- #c386b8
    hl["@keyword.coroutine"] = { fg = palette.sakura_dark }
    hl["@keyword.function"] = { fg = palette.sakura_dark }
    hl["@keyword.operator"] = { fg = palette.sakura_dark }
    hl["@keyword.import"] = { fg = palette.purple }
    hl["@keyword.storage"] = { fg = palette.sakura_dark }
    hl["@keyword.repeat"] = { fg = palette.sakura_dark }
    hl["@keyword.return"] = { fg = palette.sakura_dark }
    hl["@keyword.debug"] = { fg = palette.red }
    hl["@keyword.exception"] = { fg = palette.red }
  elseif palette_name == "warm_gray" then
    hl["@keyword"] = { fg = palette.sakura_dark } -- #cc8fa5
    hl["@keyword.coroutine"] = { fg = palette.sakura_dark }
    hl["@keyword.function"] = { fg = palette.sakura_dark }
    hl["@keyword.operator"] = { fg = palette.sakura_dark }
    hl["@keyword.import"] = { fg = palette.purple }
    hl["@keyword.storage"] = { fg = palette.sakura_dark }
    hl["@keyword.repeat"] = { fg = palette.sakura_dark }
    hl["@keyword.return"] = { fg = palette.sakura_dark }
    hl["@keyword.debug"] = { fg = palette.red }
    hl["@keyword.exception"] = { fg = palette.red }
  elseif palette_name == "muted_rose" then
    hl["@keyword"] = { fg = palette.sakura_dark } -- #b88a9a
    hl["@keyword.coroutine"] = { fg = palette.sakura_dark }
    hl["@keyword.function"] = { fg = palette.sakura_dark }
    hl["@keyword.operator"] = { fg = palette.purple } -- Different for muted_rose
    hl["@keyword.import"] = { fg = palette.purple }
    hl["@keyword.storage"] = { fg = palette.sakura_dark }
    hl["@keyword.repeat"] = { fg = palette.sakura_dark }
    hl["@keyword.return"] = { fg = palette.sakura_dark }
    hl["@keyword.debug"] = { fg = palette.red }
    hl["@keyword.exception"] = { fg = palette.red }
  elseif palette_name == "night_blue" then
    hl["@keyword"] = { fg = palette.sakura_dark } -- #c090b8
    hl["@keyword.coroutine"] = { fg = palette.sakura_dark }
    hl["@keyword.function"] = { fg = palette.sakura_dark }
    hl["@keyword.operator"] = { fg = palette.fg3 } -- #565b7e
    hl["@keyword.import"] = { fg = palette.purple } -- #bb9af7
    hl["@keyword.storage"] = { fg = palette.sakura_dark }
    hl["@keyword.repeat"] = { fg = palette.sakura_dark }
    hl["@keyword.return"] = { fg = palette.blue } -- #7aa2f7
    hl["@keyword.debug"] = { fg = palette.red }
    hl["@keyword.exception"] = { fg = palette.red }
  end
  
  -- Conditionals
  hl["@conditional"] = { fg = palette.sakura_dark }
  hl["@conditional.ternary"] = { fg = palette.sakura_dark }
  
  -- Repeat
  hl["@repeat"] = { fg = palette.sakura_dark }
  
  -- Labels
  hl["@label"] = { fg = palette.sakura_dark }
  
  -- Operators
  hl["@operator"] = { fg = palette.fg1 }
  
  -- Exceptions
  hl["@exception"] = { fg = palette.red }
  
  -- Types - different mappings per palette
  if palette_name == "soft_contrast" then
    hl["@type"] = { fg = palette.blue }
    hl["@type.builtin"] = { fg = palette.blue }
    hl["@type.definition"] = { fg = palette.blue }
    hl["@type.qualifier"] = { fg = palette.sakura_dark }
  elseif palette_name == "warm_gray" then
    hl["@type"] = { fg = palette.purple } -- Different for warm_gray
    hl["@type.builtin"] = { fg = palette.purple }
    hl["@type.definition"] = { fg = palette.purple }
    hl["@type.qualifier"] = { fg = palette.sakura_dark }
  elseif palette_name == "muted_rose" then
    hl["@type"] = { fg = palette.purple } -- Different for muted_rose
    hl["@type.builtin"] = { fg = palette.purple }
    hl["@type.definition"] = { fg = palette.purple }
    hl["@type.qualifier"] = { fg = palette.sakura_dark }
  elseif palette_name == "night_blue" then
    hl["@type"] = { fg = palette.sakura } -- #d0a5c8
    hl["@type.builtin"] = { fg = palette.sakura_dark } -- #c090b8
    hl["@type.definition"] = { fg = palette.sakura }
    hl["@type.qualifier"] = { fg = palette.sakura_dark }
  end
  
  -- Interface (for Night Blue)
  if palette_name == "night_blue" then
    hl["@interface"] = { fg = palette.purple } -- #bb9af7
    hl["@lsp.type.interface"] = { fg = palette.purple } -- #bb9af7
  end
  
  -- Attributes
  hl["@attribute"] = { fg = palette.purple }
  hl["@attribute.builtin"] = { fg = palette.purple }
  
  -- Fields - different mappings per palette
  if palette_name == "soft_contrast" then
    hl["@field"] = { fg = palette.sakura } -- Different for soft_contrast
    hl["@property"] = { fg = palette.sakura } -- #cba6c3
  elseif palette_name == "warm_gray" then
    hl["@field"] = { fg = palette.sakura } -- Different for warm_gray
    hl["@property"] = { fg = palette.sakura } -- #d5a0b5
  elseif palette_name == "muted_rose" then
    hl["@field"] = { fg = palette.sakura } -- Different for muted_rose
    hl["@property"] = { fg = palette.sakura } -- #c79fad
  elseif palette_name == "night_blue" then
    hl["@field"] = { fg = palette.sakura } -- Different for night_blue
    hl["@property"] = { fg = palette.sakura } -- #d0a5c8
  else
    hl["@field"] = { fg = palette.fg0 }
    hl["@property"] = { fg = palette.fg0 }
  end
  
  -- Namespaces - different mappings per palette
  if palette_name == "night_blue" then
    hl["@namespace"] = { fg = palette.blue } -- #7aa2f7
    hl["@namespace.builtin"] = { fg = palette.blue }
  else
    hl["@namespace"] = { fg = palette.purple }
    hl["@namespace.builtin"] = { fg = palette.purple }
  end
  
  -- Modules
  hl["@module"] = { fg = palette.purple }
  hl["@module.builtin"] = { fg = palette.purple }
  
  -- Includes
  hl["@include"] = { fg = palette.purple }
  
  -- Punctuation
  hl["@punctuation.delimiter"] = { fg = palette.fg1 }
  hl["@punctuation.bracket"] = { fg = palette.fg1 }
  hl["@punctuation.special"] = { fg = palette.sakura_light }
  
  -- Comments - different mappings per palette
  if palette_name == "night_blue" then
    hl["@comment"] = { fg = palette.fg3, italic = true }
    hl["@comment.documentation"] = { fg = palette.fg3, italic = true }
    hl["@comment.error"] = { fg = palette.red, italic = true }
    hl["@comment.warning"] = { fg = palette.yellow, italic = true }
    hl["@comment.todo"] = { fg = palette.orange, italic = true, bold = true } -- #ff9e64
    hl["@comment.note"] = { fg = palette.green, italic = true }
  elseif palette_name == "muted_rose" then
    hl["@comment"] = { fg = palette.fg3, italic = true }
    hl["@comment.documentation"] = { fg = palette.fg3, italic = true }
    hl["@comment.error"] = { fg = palette.red, italic = true }
    hl["@comment.warning"] = { fg = palette.yellow, italic = true }
    hl["@comment.todo"] = { fg = palette.orange, italic = true, bold = true } -- #e8a888
    hl["@comment.note"] = { fg = palette.green, italic = true }
  else
    hl["@comment"] = { fg = palette.fg3, italic = true }
    hl["@comment.documentation"] = { fg = palette.fg3, italic = true }
    hl["@comment.error"] = { fg = palette.red, italic = true }
    hl["@comment.warning"] = { fg = palette.yellow, italic = true }
    hl["@comment.todo"] = { fg = palette.blue, italic = true, bold = true }
    hl["@comment.note"] = { fg = palette.green, italic = true }
  end
  
  -- Tags (HTML/XML)
  hl["@tag"] = { fg = palette.sakura_light }
  hl["@tag.builtin"] = { fg = palette.sakura_light }
  hl["@tag.attribute"] = { fg = palette.sakura }
  hl["@tag.delimiter"] = { fg = palette.fg1 }
  
  -- Text
  hl["@text"] = { fg = palette.fg0 }
  hl["@text.strong"] = { bold = true }
  hl["@text.emphasis"] = { italic = true }
  hl["@text.underline"] = { underline = true }
  hl["@text.strike"] = { strikethrough = true }
  hl["@text.title"] = { fg = palette.sakura, bold = true }
  hl["@text.literal"] = { fg = palette.cyan }
  hl["@text.literal.markdown_inline"] = { fg = palette.cyan }
  hl["@text.uri"] = { fg = palette.blue, underline = true }
  hl["@text.math"] = { fg = palette.orange }
  hl["@text.environment"] = { fg = palette.purple }
  hl["@text.environment.name"] = { fg = palette.blue }
  hl["@text.reference"] = { fg = palette.sakura }
  hl["@text.todo"] = { fg = palette.blue, bold = true }
  hl["@text.note"] = { fg = palette.green }
  hl["@text.warning"] = { fg = palette.yellow }
  hl["@text.danger"] = { fg = palette.red }
  hl["@text.diff.add"] = { fg = palette.green }
  hl["@text.diff.delete"] = { fg = palette.red }
  
  -- Markup - different mappings per palette
  hl["@markup"] = { fg = palette.fg0 }
  hl["@markup.strong"] = { bold = true }
  hl["@markup.emphasis"] = { italic = true }
  hl["@markup.underline"] = { underline = true }
  hl["@markup.strike"] = { strikethrough = true }
  hl["@markup.heading"] = { fg = palette.sakura, bold = true }
  hl["@markup.quote"] = { fg = palette.fg2, italic = true }
  hl["@markup.math"] = { fg = palette.orange }
  hl["@markup.environment"] = { fg = palette.purple }
  
  if palette_name == "night_blue" then
    hl["@markup.link"] = { fg = palette.cyan, underline = true } -- #73daca
    hl["@markup.link.label"] = { fg = palette.sakura }
    hl["@markup.link.url"] = { fg = palette.cyan, underline = true }
  elseif palette_name == "muted_rose" then
    hl["@markup.link"] = { fg = palette.blue, underline = true } -- #a5c4d9
    hl["@markup.link.label"] = { fg = palette.sakura }
    hl["@markup.link.url"] = { fg = palette.blue, underline = true }
  else
    hl["@markup.link"] = { fg = palette.blue, underline = true }
    hl["@markup.link.label"] = { fg = palette.sakura }
    hl["@markup.link.url"] = { fg = palette.blue, underline = true }
  end
  
  hl["@markup.raw"] = { fg = palette.cyan }
  hl["@markup.raw.block"] = { fg = palette.cyan }
  hl["@markup.list"] = { fg = palette.sakura_dark }
  hl["@markup.list.checked"] = { fg = palette.green }
  hl["@markup.list.unchecked"] = { fg = palette.fg2 }
  
  -- Diff - different mappings per palette
  if palette_name == "night_blue" then
    hl["@diff.plus"] = { fg = palette.green } -- #9ece6a
    hl["@diff.minus"] = { fg = palette.red }
    hl["@diff.delta"] = { fg = palette.yellow }
  else
    hl["@diff.plus"] = { fg = palette.green }
    hl["@diff.minus"] = { fg = palette.red }
    hl["@diff.delta"] = { fg = palette.yellow }
  end
  
  -- Language specific highlights
  -- Lua
  hl["@lsp.type.variable.lua"] = { fg = palette.fg0 }
  hl["@lsp.type.property.lua"] = { fg = palette.fg0 }
  hl["@lsp.type.method.lua"] = { fg = palette.sakura }
  
  -- TypeScript/JavaScript
  hl["@lsp.type.class.typescript"] = { fg = palette.blue }
  hl["@lsp.type.enum.typescript"] = { fg = palette.blue }
  hl["@lsp.type.interface.typescript"] = { fg = palette.blue }
  hl["@lsp.type.namespace.typescript"] = { fg = palette.purple }
  hl["@lsp.type.parameter.typescript"] = { fg = palette.fg1 }
  hl["@lsp.type.property.typescript"] = { fg = palette.fg0 }
  hl["@lsp.type.variable.typescript"] = { fg = palette.fg0 }
  
  -- Python
  hl["@lsp.type.class.python"] = { fg = palette.blue }
  hl["@lsp.type.decorator.python"] = { fg = palette.purple }
  hl["@lsp.type.function.python"] = { fg = palette.sakura }
  hl["@lsp.type.method.python"] = { fg = palette.sakura }
  hl["@lsp.type.parameter.python"] = { fg = palette.fg1 }
  hl["@lsp.type.variable.python"] = { fg = palette.fg0 }
  
  -- Rust
  hl["@lsp.type.enum.rust"] = { fg = palette.blue }
  hl["@lsp.type.interface.rust"] = { fg = palette.blue }
  hl["@lsp.type.keyword.rust"] = { fg = palette.sakura_dark }
  hl["@lsp.type.lifetime.rust"] = { fg = palette.purple }
  hl["@lsp.type.macro.rust"] = { fg = palette.purple }
  hl["@lsp.type.method.rust"] = { fg = palette.sakura }
  hl["@lsp.type.namespace.rust"] = { fg = palette.purple }
  hl["@lsp.type.parameter.rust"] = { fg = palette.fg1 }
  hl["@lsp.type.property.rust"] = { fg = palette.fg0 }
  hl["@lsp.type.struct.rust"] = { fg = palette.blue }
  hl["@lsp.type.trait.rust"] = { fg = palette.blue }
  hl["@lsp.type.variable.rust"] = { fg = palette.fg0 }
  
  -- Go
  hl["@lsp.type.function.go"] = { fg = palette.sakura }
  hl["@lsp.type.method.go"] = { fg = palette.sakura }
  hl["@lsp.type.namespace.go"] = { fg = palette.purple }
  hl["@lsp.type.parameter.go"] = { fg = palette.fg1 }
  hl["@lsp.type.type.go"] = { fg = palette.blue }
  hl["@lsp.type.variable.go"] = { fg = palette.fg0 }
  
  -- C/C++
  hl["@lsp.type.class.cpp"] = { fg = palette.blue }
  hl["@lsp.type.enum.cpp"] = { fg = palette.blue }
  hl["@lsp.type.function.cpp"] = { fg = palette.sakura }
  hl["@lsp.type.macro.cpp"] = { fg = palette.purple }
  hl["@lsp.type.method.cpp"] = { fg = palette.sakura }
  hl["@lsp.type.namespace.cpp"] = { fg = palette.purple }
  hl["@lsp.type.parameter.cpp"] = { fg = palette.fg1 }
  hl["@lsp.type.property.cpp"] = { fg = palette.fg0 }
  hl["@lsp.type.struct.cpp"] = { fg = palette.blue }
  hl["@lsp.type.variable.cpp"] = { fg = palette.fg0 }
  
  -- Java
  hl["@lsp.type.class.java"] = { fg = palette.blue }
  hl["@lsp.type.enum.java"] = { fg = palette.blue }
  hl["@lsp.type.interface.java"] = { fg = palette.blue }
  hl["@lsp.type.method.java"] = { fg = palette.sakura }
  hl["@lsp.type.parameter.java"] = { fg = palette.fg1 }
  hl["@lsp.type.property.java"] = { fg = palette.fg0 }
  hl["@lsp.type.variable.java"] = { fg = palette.fg0 }
  
  -- Additional Treesitter highlights for specific languages
  -- Markdown
  hl["@markup.heading.1.markdown"] = { fg = palette.sakura, bold = true }
  hl["@markup.heading.2.markdown"] = { fg = palette.sakura, bold = true }
  hl["@markup.heading.3.markdown"] = { fg = palette.sakura, bold = true }
  hl["@markup.heading.4.markdown"] = { fg = palette.sakura, bold = true }
  hl["@markup.heading.5.markdown"] = { fg = palette.sakura, bold = true }
  hl["@markup.heading.6.markdown"] = { fg = palette.sakura, bold = true }
  
  -- JSON
  hl["@property.json"] = { fg = palette.sakura }
  hl["@string.special.key.json"] = { fg = palette.sakura }
  
  -- YAML
  hl["@field.yaml"] = { fg = palette.sakura }
  hl["@property.yaml"] = { fg = palette.sakura }
  
  -- TOML
  hl["@property.toml"] = { fg = palette.sakura }
  
  -- CSS
  hl["@property.css"] = { fg = palette.sakura }
  hl["@string.special.css"] = { fg = palette.cyan }
  hl["@type.css"] = { fg = palette.blue }
  
  -- HTML
  hl["@tag.html"] = { fg = palette.sakura_light }
  hl["@tag.attribute.html"] = { fg = palette.sakura }
  
  -- Vue
  hl["@tag.vue"] = { fg = palette.sakura_light }
  hl["@tag.attribute.vue"] = { fg = palette.sakura }
  
  -- TSX/JSX
  hl["@tag.tsx"] = { fg = palette.sakura_light }
  hl["@tag.attribute.tsx"] = { fg = palette.sakura }
  hl["@tag.jsx"] = { fg = palette.sakura_light }
  hl["@tag.attribute.jsx"] = { fg = palette.sakura }
  
  return hl
end

return M