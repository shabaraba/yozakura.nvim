-- Debug script to check highlight groups
local function debug_highlights()
  print("=== Yozakura Theme Debug ===")
  
  -- Check if Tree-sitter is available
  local has_ts = pcall(require, 'nvim-treesitter')
  print("Tree-sitter available:", has_ts)
  
  -- Check current palette
  local config = require("yozakura.config").get()
  print("Current palette:", config.palette or "soft_contrast")
  
  -- Check some key highlight groups
  local groups = {
    "@type",
    "@function", 
    "@string",
    "@keyword",
    "@punctuation.bracket",
    "@punctuation.delimiter",
    "@operator",
    "Type",
    "Function",
    "String",
    "Operator",
    "Delimiter"
  }
  
  print("\nHighlight groups:")
  for _, group in ipairs(groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group })
    if hl.fg then
      print(string.format("%-25s fg=#%06x", group, hl.fg))
    else
      print(string.format("%-25s (not set)", group))
    end
  end
  
  -- Check Tree-sitter queries
  if has_ts then
    local ts_parsers = require('nvim-treesitter.parsers')
    print("\nInstalled parsers:", vim.inspect(ts_parsers.available_parsers()))
  end
end

debug_highlights()