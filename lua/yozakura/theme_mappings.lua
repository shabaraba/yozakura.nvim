local M = {}

-- Theme-specific Tree-sitter mappings based on HTML specification
M.mappings = {
  soft_contrast = {
    -- Variables (from HTML mapping category)
    ["@variable"] = "#a888a1",
    ["@variable.builtin"] = "#9a6692",
    ["@property"] = "#cba6c3",  -- Properties are function-colored to distinguish from variables
    
    -- Functions & Methods (different colors for distinction)
    ["@function"] = "#cba6c3",     -- function name
    ["@function.builtin"] = "#c386b8",
    ["@function.macro"] = "#b8a5d9",
    ["@method"] = "#cba6c3",       -- method calls should match functions
    
    -- Literals
    ["@string"] = "#d9b8cf",
    ["@number"] = "#d9b8cf",  -- same as string
    ["@boolean"] = "#c386b8", -- keyword-like (from code preview)
    
    -- Types (from HTML mapping category)
    ["@type"] = "#b076a5",      -- interface type in code
    ["@type.builtin"] = "#c386b8", -- built-in types like number, boolean
    ["@constructor"] = "#cba6c3",
    
    -- Keywords (from code preview)
    ["@keyword"] = "#c386b8",        -- const, return, interface
    ["@keyword.import"] = "#9a6692",
    ["@keyword.operator"] = "#c386b8",
  },
  
  warm_gray = {
    -- Variables (from HTML mapping category)
    ["@variable"] = "#b08a95",
    ["@variable.builtin"] = "#9f6f85",
    ["@property"] = "#d5a0b5",  -- Properties use function color
    
    -- Functions & Methods
    ["@function"] = "#d5a0b5",     -- function names
    ["@function.builtin"] = "#cc8fa5",
    ["@function.macro"] = "#dba5b5",
    ["@method"] = "#d5a0b5",       -- methods (log in code preview)
    
    -- Literals
    ["@string"] = "#e0b5c5",
    ["@number"] = "#e8c0d0",  -- different from string for distinction
    ["@boolean"] = "#d5a0b5", -- from HTML boolean mapping
    
    -- Types (from HTML mapping category)
    ["@type"] = "#b57f95",
    ["@type.builtin"] = "#cc8fa5",  -- number type in code preview
    ["@constructor"] = "#cc8fa5",
    
    -- Keywords (from code preview)
    ["@keyword"] = "#cc8fa5",     -- type, function keywords
    ["@keyword.import"] = "#dba5b5",
    ["@keyword.operator"] = "#cc8fa5",
  },
  
  muted_rose = {
    -- Variables (from HTML mapping category)
    ["@variable"] = "#a08590",    -- saturation property in code
    ["@variable.builtin"] = "#906a7a",
    ["@property"] = "#a08590",    -- properties use variable color for subtle distinction
    
    -- Functions & Methods  
    ["@function"] = "#c79fad",    -- bloom function name
    ["@function.builtin"] = "#b88a9a",
    ["@function.macro"] = "#c5a5b8",
    ["@method"] = "#c79fad",      -- methods use function color
    
    -- Literals
    ["@string"] = "#d6b5c0",     -- 'excellent' string
    ["@number"] = "#d6b5c0",     -- 0.4, 0.1 numbers - same as string
    ["@boolean"] = "#c79fad",    -- from HTML boolean mapping
    
    -- Types (from HTML mapping category)
    ["@type"] = "#a67a8a",       -- darker type colors
    ["@type.builtin"] = "#b88a9a", -- number, string, void types
    ["@constructor"] = "#b88a9a",
    
    -- Keywords (from code preview)
    ["@keyword"] = "#b88a9a",     -- class, private, public, this
    ["@keyword.import"] = "#c5a5b8",
    ["@keyword.operator"] = "#a67a8a", -- different from other themes
    
    -- Special (muted_rose specific)
    ["@string.regexp"] = "#d5889c",
    ["@comment.todo"] = "#e8a888",
    ["@markup.link"] = "#a5c4d9",
  },
  
  night_blue = {
    -- Variables (from HTML mapping category and code preview)
    ["@variable"] = "#9d88a5",    -- moonPhase, starCount, petals, tree, glowing
    ["@variable.builtin"] = "#bb9af7", -- purple accent
    ["@property"] = "#d0a5c8",    -- moonPhase, petals, length properties
    ["@variable.member"] = "#7aa2f7", -- blue accent for object members
    
    -- Functions & Methods (blue accents for built-ins)
    ["@function"] = "#d0a5c8",    -- NightBloom function name
    ["@function.builtin"] = "#7aa2f7", -- useState, useEffect (blue)
    ["@function.macro"] = "#bb9af7",   -- purple accent
    ["@method"] = "#d0a5c8",      -- methods use function color
    
    -- Literals
    ["@string"] = "#e0c0d5",     -- 'new', 'full', template strings
    ["@number"] = "#f7d0e8",     -- different from string
    ["@boolean"] = "#c090b8",    -- false, true
    ["@string.special"] = "#9ece6a", -- special string handling (green)
    
    -- Types (from HTML mapping category)
    ["@type"] = "#d0a5c8",       -- NightYozakura, Petal types
    ["@type.builtin"] = "#c090b8", -- number built-in type
    ["@interface"] = "#bb9af7",   -- interface keyword gets purple
    ["@namespace"] = "#7aa2f7",   -- namespaces get blue
    ["@constructor"] = "#d0a5c8",
    
    -- Keywords (from code preview)
    ["@keyword"] = "#c090b8",     -- const, if, return
    ["@keyword.import"] = "#bb9af7", -- import gets purple
    ["@keyword.return"] = "#7aa2f7", -- return gets blue accent
    ["@keyword.operator"] = "#565b7e", -- blue-gray operators
    
    -- Special (night_blue specific)
    ["@string.regexp"] = "#f7768e",
    ["@comment.todo"] = "#ff9e64",
    ["@diff.plus"] = "#9ece6a",
    ["@markup.link"] = "#73daca",
  }
}

function M.get_mapping(palette_name, highlight_group)
  if M.mappings[palette_name] and M.mappings[palette_name][highlight_group] then
    return M.mappings[palette_name][highlight_group]
  end
  return nil
end

return M