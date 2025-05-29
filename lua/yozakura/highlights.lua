local M = {}

function M.setup(palette, config)
  local hl = {}
  
  -- Use passed config or get from config module
  config = config or require("yozakura.config").get()
  local palette_name = config.palette or "soft_contrast"
  local theme_mappings = require("yozakura.theme_mappings")
  
  -- Editor highlights
  hl.Normal = { fg = palette.fg0, bg = config.transparent and palette.none or palette.bg0 }
  hl.NormalFloat = { fg = palette.fg0, bg = config.transparent and palette.none or palette.bg1 }
  hl.FloatBorder = { fg = palette.sakura_muted, bg = config.transparent and palette.none or palette.bg1 }
  hl.ColorColumn = { bg = config.transparent and palette.none or palette.bg1 }
  hl.Cursor = { fg = palette.bg0, bg = palette.sakura }
  hl.CursorLine = { bg = config.transparent and palette.none or palette.bg1 }
  hl.CursorLineNr = { fg = palette.sakura, bg = config.transparent and palette.none or palette.bg1 }
  hl.LineNr = { fg = palette.fg3 }
  hl.SignColumn = { fg = palette.fg3, bg = config.transparent and palette.none or palette.bg0 }
  hl.VertSplit = { fg = palette.bg2 }
  hl.EndOfBuffer = { fg = palette.bg2 }
  hl.Folded = { fg = palette.fg2, bg = config.transparent and palette.none or palette.bg1 }
  hl.FoldColumn = { fg = palette.fg3, bg = config.transparent and palette.none or palette.bg0 }
  
  -- Statusline
  hl.StatusLine = { fg = palette.fg1, bg = config.transparent and palette.none or palette.bg2 }
  hl.StatusLineNC = { fg = palette.fg3, bg = config.transparent and palette.none or palette.bg1 }
  
  -- Pmenu
  hl.Pmenu = { fg = palette.fg1, bg = config.transparent and palette.none or palette.bg1 }
  hl.PmenuSel = { fg = palette.bg0, bg = palette.sakura }
  hl.PmenuSbar = { bg = config.transparent and palette.none or palette.bg2 }
  hl.PmenuThumb = { bg = palette.sakura_muted }
  
  -- Search
  hl.Search = { fg = palette.bg0, bg = palette.sakura_light }
  hl.IncSearch = { fg = palette.bg0, bg = palette.sakura }
  hl.CurSearch = { fg = palette.bg0, bg = palette.sakura }
  
  -- Visual
  hl.Visual = { bg = config.transparent and palette.bg2 or palette.bg3 }
  hl.VisualNOS = { bg = config.transparent and palette.bg2 or palette.bg3 }
  
  -- Diff
  hl.DiffAdd = { fg = palette.green, bg = config.transparent and palette.none or palette.bg1 }
  hl.DiffChange = { fg = palette.yellow, bg = config.transparent and palette.none or palette.bg1 }
  hl.DiffDelete = { fg = palette.red, bg = config.transparent and palette.none or palette.bg1 }
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
  hl.Operator = { fg = theme_mappings.get_mapping(palette_name, "@operator") or palette.fg1 }
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
  hl.Delimiter = { fg = theme_mappings.get_mapping(palette_name, "@punctuation.delimiter") or palette.fg1 }
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
  
  -- Apply theme-specific mappings
  local function apply_mapping(group)
    local color = theme_mappings.get_mapping(palette_name, group)
    if color then
      hl[group] = { fg = color }
      -- Also set the non-@ version for compatibility
      local legacy_group = group:gsub("^@", "")
      if legacy_group ~= group then
        hl[legacy_group] = { fg = color }
      end
    end
  end
  
  -- Variables
  apply_mapping("@variable")
  apply_mapping("@variable.builtin")
  apply_mapping("@property")
  if palette_name == "night_blue" then
    apply_mapping("@variable.member")
  else
    hl["@variable.member"] = { fg = palette.fg0 }
  end
  hl["@variable.parameter"] = { fg = palette.fg1 }
  
  -- Constants
  hl["@constant"] = { fg = palette.orange }
  hl["@constant.builtin"] = { fg = palette.orange }
  hl["@constant.macro"] = { fg = palette.orange }
  
  -- Strings
  apply_mapping("@string")
  hl["@string.documentation"] = { fg = theme_mappings.get_mapping(palette_name, "@string") or palette.fg0 }
  apply_mapping("@string.regexp")
  hl["@string.escape"] = { fg = palette.sakura }
  if palette_name == "night_blue" then
    apply_mapping("@string.special")
  else
    hl["@string.special"] = { fg = palette.sakura }
  end
  hl["@string.special.symbol"] = { fg = palette.orange }
  hl["@string.special.url"] = { fg = palette.blue, underline = true }
  
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
  
  -- Numbers
  apply_mapping("@number")
  hl["@number.float"] = { fg = theme_mappings.get_mapping(palette_name, "@number") or palette.orange }
  
  -- Booleans
  apply_mapping("@boolean")
  
  -- Functions
  apply_mapping("@function")
  apply_mapping("@function.builtin")
  apply_mapping("@function.macro")
  apply_mapping("@method")
  hl["@function.call"] = { fg = theme_mappings.get_mapping(palette_name, "@function") or palette.sakura }
  hl["@function.method"] = { fg = theme_mappings.get_mapping(palette_name, "@method") or palette.sakura }
  hl["@function.method.call"] = { fg = theme_mappings.get_mapping(palette_name, "@method") or palette.sakura }
  
  -- Additional method mappings for better property/method distinction
  hl["@lsp.type.method"] = { fg = theme_mappings.get_mapping(palette_name, "@method") or palette.sakura }
  hl["@lsp.type.property"] = { fg = theme_mappings.get_mapping(palette_name, "@property") or palette.fg0 }
  
  -- Methods (already handled above)
  hl["@method.call"] = { fg = theme_mappings.get_mapping(palette_name, "@method") or palette.sakura }
  
  -- Constructors
  apply_mapping("@constructor")
  
  -- Parameters
  hl["@parameter"] = { fg = palette.fg1 }
  hl["@parameter.reference"] = { fg = palette.fg1 }
  
  -- Keywords
  apply_mapping("@keyword")
  local keyword_base = theme_mappings.get_mapping(palette_name, "@keyword") or palette.sakura_dark
  hl["@keyword.coroutine"] = { fg = keyword_base }
  hl["@keyword.function"] = { fg = keyword_base }
  apply_mapping("@keyword.operator")
  apply_mapping("@keyword.import")
  hl["@keyword.storage"] = { fg = keyword_base }
  hl["@keyword.repeat"] = { fg = keyword_base }
  if palette_name == "night_blue" then
    apply_mapping("@keyword.return")
  else
    hl["@keyword.return"] = { fg = keyword_base }
  end
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
  apply_mapping("@operator")
  if not hl["@operator"] then
    hl["@operator"] = { fg = palette.fg1 }
  end
  
  -- Exceptions
  hl["@exception"] = { fg = palette.red }
  
  -- Types
  apply_mapping("@type")
  apply_mapping("@type.builtin")
  hl["@type.definition"] = { fg = theme_mappings.get_mapping(palette_name, "@type") or palette.blue }
  hl["@type.qualifier"] = { fg = palette.sakura_dark }
  
  -- Interface (for Night Blue)
  if palette_name == "night_blue" then
    apply_mapping("@interface")
    hl["@lsp.type.interface"] = { fg = theme_mappings.get_mapping(palette_name, "@interface") or palette.purple }
  end
  
  -- Attributes
  hl["@attribute"] = { fg = palette.purple }
  hl["@attribute.builtin"] = { fg = palette.purple }
  
  -- Fields and Properties - ensure proper color distinction
  apply_mapping("@field")
  apply_mapping("@property")
  
  -- For themes without specific field mapping, use property color
  if not theme_mappings.get_mapping(palette_name, "@field") then
    hl["@field"] = { fg = theme_mappings.get_mapping(palette_name, "@property") or palette.fg0 }
  end
  
  -- Namespaces
  if palette_name == "night_blue" then
    apply_mapping("@namespace")
    hl["@namespace.builtin"] = { fg = theme_mappings.get_mapping(palette_name, "@namespace") or palette.blue }
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
  apply_mapping("@punctuation.delimiter")
  apply_mapping("@punctuation.bracket")
  apply_mapping("@punctuation.special")
  
  -- If not set by theme_mappings, use default
  if not hl["@punctuation.delimiter"] then
    hl["@punctuation.delimiter"] = { fg = palette.fg1 }
  end
  if not hl["@punctuation.bracket"] then
    hl["@punctuation.bracket"] = { fg = palette.fg1 }
  end
  if not hl["@punctuation.special"] then
    hl["@punctuation.special"] = { fg = palette.sakura_light }
  end
  
  -- Comments
  hl["@comment"] = { fg = palette.fg3, italic = true }
  hl["@comment.documentation"] = { fg = palette.fg3, italic = true }
  hl["@comment.error"] = { fg = palette.red, italic = true }
  hl["@comment.warning"] = { fg = palette.yellow, italic = true }
  local todo_color = theme_mappings.get_mapping(palette_name, "@comment.todo")
  if todo_color then
    hl["@comment.todo"] = { fg = todo_color, italic = true, bold = true }
  else
    hl["@comment.todo"] = { fg = palette.blue, italic = true, bold = true }
  end
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
  
  local link_color = theme_mappings.get_mapping(palette_name, "@markup.link")
  if link_color then
    hl["@markup.link"] = { fg = link_color, underline = true }
    hl["@markup.link.url"] = { fg = link_color, underline = true }
  else
    hl["@markup.link"] = { fg = palette.blue, underline = true }
    hl["@markup.link.url"] = { fg = palette.blue, underline = true }
  end
  hl["@markup.link.label"] = { fg = palette.sakura }
  
  hl["@markup.raw"] = { fg = palette.cyan }
  hl["@markup.raw.block"] = { fg = palette.cyan }
  hl["@markup.list"] = { fg = palette.sakura_dark }
  hl["@markup.list.checked"] = { fg = palette.green }
  hl["@markup.list.unchecked"] = { fg = palette.fg2 }
  
  -- Diff
  if palette_name == "night_blue" then
    apply_mapping("@diff.plus")
  else
    hl["@diff.plus"] = { fg = palette.green }
  end
  hl["@diff.minus"] = { fg = palette.red }
  hl["@diff.delta"] = { fg = palette.yellow }
  
  -- Language specific highlights
  -- Lua
  hl["@lsp.type.variable.lua"] = { fg = palette.fg0 }
  hl["@lsp.type.property.lua"] = { fg = palette.fg0 }
  hl["@lsp.type.method.lua"] = { fg = palette.sakura }
  
  -- TypeScript/JavaScript
  hl["@lsp.type.class.typescript"] = { fg = theme_mappings.get_mapping(palette_name, "@type") or palette.blue }
  hl["@lsp.type.enum.typescript"] = { fg = theme_mappings.get_mapping(palette_name, "@type") or palette.blue }
  hl["@lsp.type.interface.typescript"] = { fg = theme_mappings.get_mapping(palette_name, "@type") or palette.blue }
  hl["@lsp.type.namespace.typescript"] = { fg = palette.purple }
  hl["@lsp.type.parameter.typescript"] = { fg = palette.fg1 }
  hl["@lsp.type.property.typescript"] = { fg = theme_mappings.get_mapping(palette_name, "@property") or palette.fg0 }
  hl["@lsp.type.variable.typescript"] = { fg = theme_mappings.get_mapping(palette_name, "@variable") or palette.fg0 }
  
  -- Additional TypeScript/JavaScript specific groups
  hl["@type.typescript"] = { fg = theme_mappings.get_mapping(palette_name, "@type") or palette.blue }
  hl["@type.javascript"] = { fg = theme_mappings.get_mapping(palette_name, "@type") or palette.blue }
  hl["@function.typescript"] = { fg = theme_mappings.get_mapping(palette_name, "@function") or palette.sakura }
  hl["@function.javascript"] = { fg = theme_mappings.get_mapping(palette_name, "@function") or palette.sakura }
  hl["@string.typescript"] = { fg = theme_mappings.get_mapping(palette_name, "@string") or palette.cyan }
  hl["@string.javascript"] = { fg = theme_mappings.get_mapping(palette_name, "@string") or palette.cyan }
  
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