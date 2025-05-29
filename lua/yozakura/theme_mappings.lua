local M = {}

-- Theme-specific Tree-sitter mappings based on HTML specification
M.mappings = {
  soft_contrast = {
    -- Variables (#a888a1, #9a6692, #cba6c3)
    ["@variable"] = "#a888a1",
    ["@variable.builtin"] = "#9a6692",
    ["@property"] = "#cba6c3",
    
    -- Functions (#cba6c3, #c386b8, #b8a5d9)
    ["@function"] = "#cba6c3",
    ["@function.builtin"] = "#c386b8",
    ["@function.macro"] = "#b8a5d9",
    ["@method"] = "#cba6c3",
    
    -- Literals
    ["@string"] = "#d9b8cf",
    ["@number"] = "#d9b8cf",
    ["@boolean"] = "#d9b8cf",
    
    -- Types (#b076a5, #9a6692, #cba6c3)
    ["@type"] = "#b076a5",
    ["@type.builtin"] = "#9a6692",
    ["@constructor"] = "#cba6c3",
    
    -- Keywords
    ["@keyword"] = "#c386b8",
    ["@keyword.import"] = "#9a6692",
    ["@keyword.operator"] = "#c386b8",
  },
  
  warm_gray = {
    -- Variables (#b08a95, #9f6f85, #d5a0b5)
    ["@variable"] = "#b08a95",
    ["@variable.builtin"] = "#9f6f85",
    ["@property"] = "#d5a0b5",
    
    -- Functions (#d5a0b5, #cc8fa5, #dba5b5)
    ["@function"] = "#d5a0b5",
    ["@function.builtin"] = "#cc8fa5",
    ["@function.macro"] = "#dba5b5",
    ["@method"] = "#d5a0b5",
    
    -- Literals
    ["@string"] = "#e0b5c5",
    ["@number"] = "#e8c0d0",
    ["@boolean"] = "#d5a0b5",
    
    -- Types (#b57f95, #9f6f85, #cc8fa5)
    ["@type"] = "#b57f95",
    ["@type.builtin"] = "#9f6f85",
    ["@constructor"] = "#cc8fa5",
    
    -- Keywords
    ["@keyword"] = "#cc8fa5",
    ["@keyword.import"] = "#dba5b5",
    ["@keyword.operator"] = "#cc8fa5",
  },
  
  muted_rose = {
    -- Variables (#a08590, #906a7a, #c79fad)
    ["@variable"] = "#a08590",
    ["@variable.builtin"] = "#906a7a",
    ["@property"] = "#c79fad",
    
    -- Functions (#c79fad, #b88a9a, #c5a5b8)
    ["@function"] = "#c79fad",
    ["@function.builtin"] = "#b88a9a",
    ["@function.macro"] = "#c5a5b8",
    ["@method"] = "#c79fad",
    
    -- Literals
    ["@string"] = "#d6b5c0",
    ["@number"] = "#e6c5d0",
    ["@boolean"] = "#c79fad",
    
    -- Types (#a67a8a, #906a7a, #b88a9a)
    ["@type"] = "#a67a8a",
    ["@type.builtin"] = "#906a7a",
    ["@constructor"] = "#b88a9a",
    
    -- Keywords
    ["@keyword"] = "#b88a9a",
    ["@keyword.import"] = "#c5a5b8",
    ["@keyword.operator"] = "#a67a8a",
    
    -- Special (muted_rose specific)
    ["@string.regexp"] = "#d5889c",
    ["@comment.todo"] = "#e8a888",
    ["@markup.link"] = "#a5c4d9",
  },
  
  night_blue = {
    -- Variables (#9d88a5, #bb9af7, #d0a5c8, #7aa2f7)
    ["@variable"] = "#9d88a5",
    ["@variable.builtin"] = "#bb9af7",
    ["@property"] = "#d0a5c8",
    ["@variable.member"] = "#7aa2f7",
    
    -- Functions (#d0a5c8, #7aa2f7, #bb9af7, #e0c0d5)
    ["@function"] = "#d0a5c8",
    ["@function.builtin"] = "#7aa2f7",
    ["@function.macro"] = "#bb9af7",
    ["@method"] = "#e0c0d5",
    
    -- Literals
    ["@string"] = "#e0c0d5",
    ["@number"] = "#f7d0e8",
    ["@boolean"] = "#c090b8",
    ["@string.special"] = "#9ece6a",
    
    -- Types (#d0a5c8, #c090b8, #bb9af7, #7aa2f7)
    ["@type"] = "#d0a5c8",
    ["@type.builtin"] = "#c090b8",
    ["@interface"] = "#bb9af7",
    ["@namespace"] = "#7aa2f7",
    ["@constructor"] = "#d0a5c8",
    
    -- Keywords
    ["@keyword"] = "#c090b8",
    ["@keyword.import"] = "#bb9af7",
    ["@keyword.return"] = "#7aa2f7",
    ["@keyword.operator"] = "#565b7e",
    
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