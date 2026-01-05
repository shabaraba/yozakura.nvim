-- ===================================================================
-- Yozakura - A Lush-based Neovim colorscheme
-- Inspired by cherry blossoms at night
-- ===================================================================

local lush = require('lush')
local hsl = lush.hsl

-- Load palette configuration
local config = require("yozakura.config").get()
local palette_data = require("yozakura.palette").setup({ palette = config.palette })

-- Convert hex colors to HSL for lush
local function hex_to_hsl(hex)
  return hsl(hex)
end

-- Build palette with HSL colors
local p = {
  -- Background colors
  bg0 = hex_to_hsl(palette_data.bg0),
  bg1 = hex_to_hsl(palette_data.bg1),
  bg2 = hex_to_hsl(palette_data.bg2),
  bg3 = hex_to_hsl(palette_data.bg3),

  -- Foreground colors
  fg0 = hex_to_hsl(palette_data.fg0),
  fg1 = hex_to_hsl(palette_data.fg1),
  fg2 = hex_to_hsl(palette_data.fg2),
  fg3 = hex_to_hsl(palette_data.fg3),

  -- Sakura colors
  sakura = hex_to_hsl(palette_data.sakura),
  sakura_light = hex_to_hsl(palette_data.sakura_light),
  sakura_dark = hex_to_hsl(palette_data.sakura_dark),
  sakura_muted = hex_to_hsl(palette_data.sakura_muted),

  -- Accent colors
  red = hex_to_hsl(palette_data.red),
  green = hex_to_hsl(palette_data.green),
  yellow = hex_to_hsl(palette_data.yellow),
  blue = hex_to_hsl(palette_data.blue),
  purple = hex_to_hsl(palette_data.purple),
  cyan = hex_to_hsl(palette_data.cyan),
  orange = hex_to_hsl(palette_data.orange),

  none = "NONE",
}

-- Theme mappings for palette-specific overrides
local theme_mappings = require("yozakura.theme_mappings")
local palette_name = config.palette or "warm_gray"

-- Helper function to get theme-specific color or fallback
local function theme_color(group, fallback)
  local color = theme_mappings.get_mapping(palette_name, group)
  if color then
    return hex_to_hsl(color)
  end
  return fallback
end

-- Transparent background helper
local function bg(color)
  if config.transparent then
    return p.none
  end
  return color
end

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  return {
    -- ===================================================================
    -- Editor UI
    -- ===================================================================
    Normal       { fg = p.fg0, bg = bg(p.bg0) },
    NormalFloat  { fg = p.fg0, bg = bg(p.bg1) },
    FloatBorder  { fg = p.sakura_muted, bg = bg(p.bg1) },
    ColorColumn  { bg = bg(p.bg1) },
    Cursor       { fg = p.bg0, bg = p.sakura },
    CursorLine   { bg = bg(p.bg1) },
    CursorLineNr { fg = p.sakura, bg = bg(p.bg1) },
    LineNr       { fg = p.fg3 },
    SignColumn   { fg = p.fg3, bg = bg(p.bg0) },
    VertSplit    { fg = p.bg2 },
    EndOfBuffer  { fg = p.bg2 },
    Folded       { fg = p.fg2, bg = bg(p.bg1) },
    FoldColumn   { fg = p.fg3, bg = bg(p.bg0) },

    -- Statusline
    StatusLine   { fg = p.fg1, bg = bg(p.bg2) },
    StatusLineNC { fg = p.fg3, bg = bg(p.bg1) },

    -- Pmenu (Popup menu)
    Pmenu        { fg = p.fg1, bg = bg(p.bg1) },
    PmenuSel     { fg = p.bg0, bg = p.sakura },
    PmenuSbar    { bg = bg(p.bg2) },
    PmenuThumb   { bg = p.sakura_muted },

    -- Search
    Search       { fg = p.bg0, bg = p.sakura_light },
    IncSearch    { fg = p.bg0, bg = p.sakura },
    CurSearch    { fg = p.bg0, bg = p.sakura },

    -- Visual
    Visual       { bg = config.transparent and p.bg2 or p.bg3 },
    VisualNOS    { Visual },

    -- Diff
    DiffAdd      { fg = p.green, bg = bg(p.bg1) },
    DiffChange   { fg = p.yellow, bg = bg(p.bg1) },
    DiffDelete   { fg = p.red, bg = bg(p.bg1) },
    DiffText     { fg = p.bg0, bg = p.yellow },

    -- ===================================================================
    -- Syntax Highlighting
    -- ===================================================================
    Comment      { fg = p.fg3, gui = "italic" },
    Constant     { fg = p.orange },
    String       { fg = p.cyan },
    Character    { String },
    Number       { fg = p.orange },
    Boolean      { fg = p.orange },
    Float        { Number },

    Identifier   { fg = p.fg0 },
    Function     { fg = p.sakura },

    Statement    { fg = p.sakura_dark },
    Conditional  { Statement },
    Repeat       { Statement },
    Label        { Statement },
    Operator     { fg = theme_color("@operator", p.fg1) },
    Keyword      { fg = p.sakura_dark },
    Exception    { fg = p.red },

    PreProc      { fg = p.purple },
    Include      { PreProc },
    Define       { PreProc },
    Macro        { PreProc },
    PreCondit    { PreProc },

    Type         { fg = p.blue },
    StorageClass { Type },
    Structure    { Type },
    Typedef      { Type },

    Special      { fg = p.sakura_light },
    SpecialChar  { Special },
    Tag          { Special },
    Delimiter    { fg = theme_color("@punctuation.delimiter", p.fg1) },
    SpecialComment { fg = p.fg2, gui = "italic" },
    Debug        { fg = p.red },

    Underlined   { gui = "underline" },
    Ignore       { fg = p.fg3 },
    Error        { fg = p.red },
    Todo         { fg = p.yellow, gui = "bold" },

    -- ===================================================================
    -- Diagnostics
    -- ===================================================================
    DiagnosticError { fg = p.red },
    DiagnosticWarn  { fg = p.yellow },
    DiagnosticInfo  { fg = p.blue },
    DiagnosticHint  { fg = p.cyan },

    -- ===================================================================
    -- Git Signs
    -- ===================================================================
    GitSignsAdd    { fg = p.green },
    GitSignsChange { fg = p.yellow },
    GitSignsDelete { fg = p.red },

    -- ===================================================================
    -- Treesitter Groups
    -- ===================================================================
    -- Variables
    sym"@variable"              { fg = theme_color("@variable", p.fg0) },
    sym"@variable.builtin"      { fg = theme_color("@variable.builtin", p.fg0) },
    sym"@variable.parameter"    { fg = p.fg1 },
    sym"@variable.member"       { fg = palette_name == "night_blue" and theme_color("@variable.member", p.fg0) or p.fg0 },

    -- Constants
    sym"@constant"              { Constant },
    sym"@constant.builtin"      { Constant },
    sym"@constant.macro"        { Constant },

    -- Strings
    sym"@string"                { fg = theme_color("@string", p.cyan) },
    sym"@string.documentation"  { fg = theme_color("@string", p.fg0) },
    sym"@string.regexp"         { fg = theme_color("@string.regexp", p.cyan) },
    sym"@string.escape"         { fg = p.sakura },
    sym"@string.special"        { fg = palette_name == "night_blue" and theme_color("@string.special", p.sakura) or p.sakura },
    sym"@string.special.symbol" { fg = p.orange },
    sym"@string.special.url"    { fg = p.blue, gui = "underline" },

    -- Characters
    sym"@character"             { fg = p.sakura_light },
    sym"@character.special"     { fg = p.sakura },

    -- Numbers & Booleans
    sym"@number"                { fg = theme_color("@number", p.orange) },
    sym"@number.float"          { sym"@number" },
    sym"@boolean"               { fg = theme_color("@boolean", p.orange) },

    -- Functions & Methods
    sym"@function"              { fg = theme_color("@function", p.sakura) },
    sym"@function.builtin"      { sym"@function" },
    sym"@function.macro"        { sym"@function" },
    sym"@function.call"         { sym"@function" },
    sym"@function.method"       { fg = theme_color("@method", p.sakura) },
    sym"@function.method.call"  { sym"@function.method" },
    sym"@method"                { fg = theme_color("@method", p.sakura) },
    sym"@method.call"           { sym"@method" },
    sym"@constructor"           { fg = theme_color("@constructor", p.sakura) },

    -- Parameters
    sym"@parameter"             { fg = p.fg1 },
    sym"@parameter.reference"   { sym"@parameter" },

    -- Keywords
    sym"@keyword"               { fg = theme_color("@keyword", p.sakura_dark) },
    sym"@keyword.coroutine"     { sym"@keyword" },
    sym"@keyword.function"      { sym"@keyword" },
    sym"@keyword.operator"      { fg = theme_color("@keyword.operator", p.sakura_dark) },
    sym"@keyword.import"        { fg = theme_color("@keyword.import", p.purple) },
    sym"@keyword.storage"       { sym"@keyword" },
    sym"@keyword.repeat"        { sym"@keyword" },
    sym"@keyword.return"        { fg = palette_name == "night_blue" and theme_color("@keyword.return", p.sakura_dark) or p.sakura_dark },
    sym"@keyword.debug"         { fg = p.red },
    sym"@keyword.exception"     { fg = p.red },

    -- Conditionals & Loops
    sym"@conditional"           { Statement },
    sym"@conditional.ternary"   { Statement },
    sym"@repeat"                { Statement },
    sym"@label"                 { Statement },

    -- Operators
    sym"@operator"              { Operator },
    sym"@exception"             { Exception },

    -- Types
    sym"@type"                  { fg = theme_color("@type", p.blue) },
    sym"@type.builtin"          { sym"@type" },
    sym"@type.definition"       { sym"@type" },
    sym"@type.qualifier"        { fg = p.sakura_dark },
    sym"@interface"             { fg = palette_name == "night_blue" and theme_color("@interface", p.purple) or p.blue },

    -- Attributes
    sym"@attribute"             { fg = p.purple },
    sym"@attribute.builtin"     { sym"@attribute" },

    -- Fields & Properties
    sym"@field"                 { fg = theme_color("@field", theme_color("@property", p.fg0)) },
    sym"@property"              { fg = theme_color("@property", p.fg0) },

    -- Namespaces & Modules
    sym"@namespace"             { fg = palette_name == "night_blue" and theme_color("@namespace", p.blue) or p.purple },
    sym"@namespace.builtin"     { sym"@namespace" },
    sym"@module"                { fg = p.purple },
    sym"@module.builtin"        { sym"@module" },

    -- Includes
    sym"@include"               { PreProc },

    -- Punctuation
    sym"@punctuation.delimiter" { fg = theme_color("@punctuation.delimiter", p.fg1) },
    sym"@punctuation.bracket"   { fg = theme_color("@punctuation.bracket", p.fg1) },
    sym"@punctuation.special"   { fg = theme_color("@punctuation.special", p.sakura_light) },

    -- Comments
    sym"@comment"               { Comment },
    sym"@comment.documentation" { Comment },
    sym"@comment.error"         { fg = p.red, gui = "italic" },
    sym"@comment.warning"       { fg = p.yellow, gui = "italic" },
    sym"@comment.todo"          { fg = theme_color("@comment.todo", p.blue), gui = "italic,bold" },
    sym"@comment.note"          { fg = p.green, gui = "italic" },

    -- Tags (HTML/XML)
    sym"@tag"                   { Tag },
    sym"@tag.builtin"           { Tag },
    sym"@tag.attribute"         { fg = p.sakura },
    sym"@tag.delimiter"         { Delimiter },

    -- Markup (Markdown, etc.)
    sym"@markup"                { fg = p.fg0 },
    sym"@markup.strong"         { gui = "bold" },
    sym"@markup.emphasis"       { gui = "italic" },
    sym"@markup.underline"      { gui = "underline" },
    sym"@markup.strike"         { gui = "strikethrough" },
    sym"@markup.heading"        { fg = p.sakura, gui = "bold" },
    sym"@markup.quote"          { fg = p.fg2, gui = "italic" },
    sym"@markup.math"           { fg = p.orange },
    sym"@markup.environment"    { fg = p.purple },
    sym"@markup.link"           { fg = theme_color("@markup.link", p.blue), gui = "underline" },
    sym"@markup.link.url"       { sym"@markup.link" },
    sym"@markup.link.label"     { fg = p.sakura },
    sym"@markup.raw"            { fg = p.cyan },
    sym"@markup.raw.block"      { sym"@markup.raw" },
    sym"@markup.list"           { fg = p.sakura_dark },
    sym"@markup.list.checked"   { fg = p.green },
    sym"@markup.list.unchecked" { fg = p.fg2 },

    -- Diff
    sym"@diff.plus"             { fg = palette_name == "night_blue" and theme_color("@diff.plus", p.green) or p.green },
    sym"@diff.minus"            { fg = p.red },
    sym"@diff.delta"            { fg = p.yellow },

    -- ===================================================================
    -- LSP Semantic Tokens
    -- ===================================================================
    sym"@lsp.type.method"       { sym"@method" },
    sym"@lsp.type.property"     { sym"@property" },
    sym"@lsp.type.variable"     { sym"@variable" },
    sym"@lsp.type.interface"    { sym"@interface" },

    -- Language-specific LSP tokens
    -- Lua
    sym"@lsp.type.variable.lua"   { fg = p.fg0 },
    sym"@lsp.type.property.lua"   { fg = p.fg0 },
    sym"@lsp.type.method.lua"     { fg = p.sakura },

    -- TypeScript/JavaScript
    sym"@lsp.type.class.typescript"     { sym"@type" },
    sym"@lsp.type.enum.typescript"      { sym"@type" },
    sym"@lsp.type.interface.typescript" { sym"@type" },
    sym"@lsp.type.namespace.typescript" { fg = p.purple },
    sym"@lsp.type.parameter.typescript" { sym"@parameter" },
    sym"@lsp.type.property.typescript"  { sym"@property" },
    sym"@lsp.type.variable.typescript"  { sym"@variable" },

    -- Python
    sym"@lsp.type.class.python"     { Type },
    sym"@lsp.type.decorator.python" { fg = p.purple },
    sym"@lsp.type.function.python"  { Function },
    sym"@lsp.type.method.python"    { sym"@method" },
    sym"@lsp.type.parameter.python" { sym"@parameter" },
    sym"@lsp.type.variable.python"  { sym"@variable" },

    -- ===================================================================
    -- Language-specific Treesitter
    -- ===================================================================
    -- TypeScript/JavaScript
    sym"@type.typescript"     { sym"@type" },
    sym"@type.javascript"     { sym"@type" },
    sym"@function.typescript" { sym"@function" },
    sym"@function.javascript" { sym"@function" },
    sym"@string.typescript"   { sym"@string" },
    sym"@string.javascript"   { sym"@string" },

    -- Markdown
    sym"@markup.heading.1.markdown" { sym"@markup.heading" },
    sym"@markup.heading.2.markdown" { sym"@markup.heading" },
    sym"@markup.heading.3.markdown" { sym"@markup.heading" },
    sym"@markup.heading.4.markdown" { sym"@markup.heading" },
    sym"@markup.heading.5.markdown" { sym"@markup.heading" },
    sym"@markup.heading.6.markdown" { sym"@markup.heading" },

    -- JSON
    sym"@property.json"          { fg = p.sakura },
    sym"@string.special.key.json" { fg = p.sakura },

    -- YAML
    sym"@field.yaml"    { fg = p.sakura },
    sym"@property.yaml" { fg = p.sakura },

    -- TOML
    sym"@property.toml" { fg = p.sakura },

    -- CSS
    sym"@property.css"        { fg = p.sakura },
    sym"@string.special.css"  { sym"@string" },
    sym"@type.css"            { Type },

    -- HTML/Vue/JSX/TSX
    sym"@tag.html"           { Tag },
    sym"@tag.attribute.html" { sym"@tag.attribute" },
    sym"@tag.vue"            { Tag },
    sym"@tag.attribute.vue"  { sym"@tag.attribute" },
    sym"@tag.tsx"            { Tag },
    sym"@tag.attribute.tsx"  { sym"@tag.attribute" },
    sym"@tag.jsx"            { Tag },
    sym"@tag.attribute.jsx"  { sym"@tag.attribute" },
  }
end)
---@diagnostic enable: undefined-global

return theme
