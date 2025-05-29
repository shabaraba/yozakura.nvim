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
    
    -- Punctuation (white/light colors)
    ["@punctuation.delimiter"] = "#d9d9e9",  -- , ; :
    ["@punctuation.bracket"] = "#d9d9e9",    -- () {} []
    ["@punctuation.special"] = "#d9d9e9",    -- Other special punctuation
    ["@operator"] = "#d9d9e9",               -- = + - * / etc
  },
  
  warm_gray = {
    -- Variables (from screenshot)
    ["@variable"] = "#b08a95",      -- night variable
    ["@variable.builtin"] = "#9f6f85",
    ["@property"] = "#d5a0b5",      -- temperature, eyeStrain properties
    
    -- Functions & Methods
    ["@function"] = "#d5a0b5",      -- relax function
    ["@function.builtin"] = "#cc8fa5",
    ["@function.macro"] = "#dba5b5",
    ["@method"] = "#d5a0b5",        -- log method
    
    -- Literals
    ["@string"] = "#e0b5c5",        -- 'warm', 'minimal', 'Comfortable viewing'
    ["@number"] = "#cc8fa5",        -- use type color for number (from screenshot)
    ["@boolean"] = "#d5a0b5",
    
    -- Types (from screenshot)
    ["@type"] = "#d5a0b5",          -- WarmNight type (pink in screenshot)
    ["@type.builtin"] = "#cc8fa5",  -- number type (darker pink)
    ["@constructor"] = "#cc8fa5",
    
    -- Keywords
    ["@keyword"] = "#cc8fa5",       -- type, function keywords
    ["@keyword.import"] = "#dba5b5",
    ["@keyword.operator"] = "#cc8fa5",
    
    -- Punctuation (white/light colors)
    ["@punctuation.delimiter"] = "#e0e0d5",  -- , ; :
    ["@punctuation.bracket"] = "#e0e0d5",    -- () {} []
    ["@punctuation.special"] = "#e0e0d5",    -- Other special punctuation
    ["@operator"] = "#e0e0d5",               -- = + - * / etc
  },
  
  muted_rose = {
    -- Variables (from screenshot)
    ["@variable"] = "#a08590",      -- saturation, visibility vars
    ["@variable.builtin"] = "#906a7a",
    ["@property"] = "#a08590",      -- properties use variable color
    
    -- Functions & Methods  
    ["@function"] = "#c79fad",      -- bloom function
    ["@function.builtin"] = "#b88a9a",
    ["@function.macro"] = "#c5a5b8",
    ["@method"] = "#c79fad",        -- methods use function color
    
    -- Literals
    ["@string"] = "#d6b5c0",        -- 'excellent' string
    ["@number"] = "#d6b5c0",        -- 0.4, 0.1 numbers
    ["@boolean"] = "#c79fad",
    
    -- Types (from screenshot)
    ["@type"] = "#c79fad",          -- MutedSakura type (pink in screenshot)
    ["@type.builtin"] = "#b88a9a",  -- number, string, void types
    ["@constructor"] = "#b88a9a",
    
    -- Keywords
    ["@keyword"] = "#b88a9a",       -- class, private, public
    ["@keyword.import"] = "#c5a5b8",
    ["@keyword.operator"] = "#a67a8a",
    
    -- Special (muted_rose specific)
    ["@string.regexp"] = "#d5889c",
    ["@comment.todo"] = "#e8a888",
    ["@markup.link"] = "#a5c4d9",
    
    -- Punctuation (white/light colors)
    ["@punctuation.delimiter"] = "#d8d8e0",  -- , ; :
    ["@punctuation.bracket"] = "#d8d8e0",    -- () {} []
    ["@punctuation.special"] = "#d8d8e0",    -- Other special punctuation
    ["@operator"] = "#d8d8e0",               -- = + - * / etc
  },
  
  night_blue = {
    -- Variables (from screenshot analysis)
    ["@variable"] = "#9d88a5",    -- tree, glowing variables
    ["@variable.builtin"] = "#bb9af7", -- purple accent
    ["@property"] = "#d0a5c8",    -- moonPhase, petals, length properties (pink in screenshot)
    ["@variable.member"] = "#d0a5c8", -- object members should match properties
    
    -- Functions & Methods (from screenshot - blue for built-ins)
    ["@function"] = "#d0a5c8",    -- NightBloom function name (pink)
    ["@function.builtin"] = "#7aa2f7", -- useState, useEffect (blue in screenshot)
    ["@function.macro"] = "#bb9af7",   -- purple accent
    ["@method"] = "#7aa2f7",      -- method calls should be blue like built-ins
    
    -- Literals (from screenshot)
    ["@string"] = "#e0c0d5",     -- 'react', 'new', 'full' should be pink, not green
    ["@number"] = "#f7d0e8",     -- numbers
    ["@boolean"] = "#c090b8",    -- false, true
    ["@string.special"] = "#e0c0d5", -- template strings should match regular strings
    
    -- Types (from screenshot - should be pink)
    ["@type"] = "#d0a5c8",       -- NightYozakura, Petal types (pink in screenshot)
    ["@type.builtin"] = "#c090b8", -- number, boolean built-in types
    ["@interface"] = "#c090b8",   -- interface keyword (not purple)
    ["@namespace"] = "#7aa2f7",   -- namespaces get blue
    ["@constructor"] = "#d0a5c8",
    
    -- Keywords (from screenshot)
    ["@keyword"] = "#c090b8",     -- const, if, return
    ["@keyword.import"] = "#bb9af7", -- import gets purple
    ["@keyword.return"] = "#7aa2f7", -- return gets blue accent
    ["@keyword.operator"] = "#565b7e", -- blue-gray operators
    
    -- Special (night_blue specific)
    ["@string.regexp"] = "#f7768e",
    ["@comment.todo"] = "#ff9e64",
    ["@diff.plus"] = "#9ece6a",
    ["@markup.link"] = "#73daca",
    
    -- Punctuation (white/light colors)
    ["@punctuation.delimiter"] = "#e0e0f0",  -- , ; :
    ["@punctuation.bracket"] = "#e0e0f0",    -- () {} []
    ["@punctuation.special"] = "#e0e0f0",    -- Other special punctuation
    ["@operator"] = "#e0e0f0",               -- = + - * / etc
  }
}

function M.get_mapping(palette_name, highlight_group)
  if M.mappings[palette_name] and M.mappings[palette_name][highlight_group] then
    return M.mappings[palette_name][highlight_group]
  end
  return nil
end

return M