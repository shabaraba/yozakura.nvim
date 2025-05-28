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
  -- Variables
  hl["@variable"] = { fg = palette.fg0 }
  hl["@variable.builtin"] = { fg = palette.purple }
  hl["@variable.parameter"] = { fg = palette.fg1 }
  hl["@variable.member"] = { fg = palette.fg0 }
  
  -- Constants
  hl["@constant"] = { fg = palette.orange }
  hl["@constant.builtin"] = { fg = palette.orange }
  hl["@constant.macro"] = { fg = palette.orange }
  
  -- Strings
  hl["@string"] = { fg = palette.cyan }
  hl["@string.documentation"] = { fg = palette.cyan }
  hl["@string.regex"] = { fg = palette.cyan }
  hl["@string.escape"] = { fg = palette.sakura_light }
  hl["@string.special"] = { fg = palette.sakura_light }
  hl["@string.special.symbol"] = { fg = palette.orange }
  hl["@string.special.url"] = { fg = palette.blue, underline = true }
  
  -- Characters
  hl["@character"] = { fg = palette.cyan }
  hl["@character.special"] = { fg = palette.sakura_light }
  
  -- Numbers
  hl["@number"] = { fg = palette.orange }
  hl["@number.float"] = { fg = palette.orange }
  
  -- Booleans
  hl["@boolean"] = { fg = palette.orange }
  
  -- Functions
  hl["@function"] = { fg = palette.sakura }
  hl["@function.builtin"] = { fg = palette.sakura }
  hl["@function.call"] = { fg = palette.sakura }
  hl["@function.macro"] = { fg = palette.purple }
  hl["@function.method"] = { fg = palette.sakura }
  hl["@function.method.call"] = { fg = palette.sakura }
  
  -- Methods
  hl["@method"] = { fg = palette.sakura }
  hl["@method.call"] = { fg = palette.sakura }
  
  -- Constructors
  hl["@constructor"] = { fg = palette.sakura }
  
  -- Parameters
  hl["@parameter"] = { fg = palette.fg1 }
  hl["@parameter.reference"] = { fg = palette.fg1 }
  
  -- Keywords
  hl["@keyword"] = { fg = palette.sakura_dark }
  hl["@keyword.coroutine"] = { fg = palette.sakura_dark }
  hl["@keyword.function"] = { fg = palette.sakura_dark }
  hl["@keyword.operator"] = { fg = palette.sakura_dark }
  hl["@keyword.import"] = { fg = palette.purple }
  hl["@keyword.storage"] = { fg = palette.sakura_dark }
  hl["@keyword.repeat"] = { fg = palette.sakura_dark }
  hl["@keyword.return"] = { fg = palette.sakura_dark }
  hl["@keyword.debug"] = { fg = palette.red }
  hl["@keyword.exception"] = { fg = palette.red }
  
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
  
  -- Types
  hl["@type"] = { fg = palette.blue }
  hl["@type.builtin"] = { fg = palette.blue }
  hl["@type.definition"] = { fg = palette.blue }
  hl["@type.qualifier"] = { fg = palette.sakura_dark }
  
  -- Attributes
  hl["@attribute"] = { fg = palette.purple }
  hl["@attribute.builtin"] = { fg = palette.purple }
  
  -- Fields
  hl["@field"] = { fg = palette.fg0 }
  hl["@property"] = { fg = palette.fg0 }
  
  -- Namespaces
  hl["@namespace"] = { fg = palette.purple }
  hl["@namespace.builtin"] = { fg = palette.purple }
  
  -- Modules
  hl["@module"] = { fg = palette.purple }
  hl["@module.builtin"] = { fg = palette.purple }
  
  -- Includes
  hl["@include"] = { fg = palette.purple }
  
  -- Punctuation
  hl["@punctuation.delimiter"] = { fg = palette.fg1 }
  hl["@punctuation.bracket"] = { fg = palette.fg1 }
  hl["@punctuation.special"] = { fg = palette.sakura_light }
  
  -- Comments
  hl["@comment"] = { fg = palette.fg3, italic = true }
  hl["@comment.documentation"] = { fg = palette.fg3, italic = true }
  hl["@comment.error"] = { fg = palette.red, italic = true }
  hl["@comment.warning"] = { fg = palette.yellow, italic = true }
  hl["@comment.todo"] = { fg = palette.blue, italic = true, bold = true }
  hl["@comment.note"] = { fg = palette.green, italic = true }
  
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
  
  -- Markup
  hl["@markup"] = { fg = palette.fg0 }
  hl["@markup.strong"] = { bold = true }
  hl["@markup.emphasis"] = { italic = true }
  hl["@markup.underline"] = { underline = true }
  hl["@markup.strike"] = { strikethrough = true }
  hl["@markup.heading"] = { fg = palette.sakura, bold = true }
  hl["@markup.quote"] = { fg = palette.fg2, italic = true }
  hl["@markup.math"] = { fg = palette.orange }
  hl["@markup.environment"] = { fg = palette.purple }
  hl["@markup.link"] = { fg = palette.blue, underline = true }
  hl["@markup.link.label"] = { fg = palette.sakura }
  hl["@markup.link.url"] = { fg = palette.blue, underline = true }
  hl["@markup.raw"] = { fg = palette.cyan }
  hl["@markup.raw.block"] = { fg = palette.cyan }
  hl["@markup.list"] = { fg = palette.sakura_dark }
  hl["@markup.list.checked"] = { fg = palette.green }
  hl["@markup.list.unchecked"] = { fg = palette.fg2 }
  
  -- Diff
  hl["@diff.plus"] = { fg = palette.green }
  hl["@diff.minus"] = { fg = palette.red }
  hl["@diff.delta"] = { fg = palette.yellow }
  
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