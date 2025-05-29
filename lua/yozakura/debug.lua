local M = {}

function M.show_highlights()
  local config = require("yozakura.config").get()
  local palette_name = config.palette or "soft_contrast"
  local theme_mappings = require("yozakura.theme_mappings")
  
  print("=== Yozakura Debug Info ===")
  print("Current palette: " .. palette_name)
  print("")
  
  -- Key highlight groups to check
  local groups = {
    "@type",
    "@type.builtin",
    "@function",
    "@function.builtin",
    "@string",
    "@number",
    "@keyword",
    "@variable",
    "@property",
    "@punctuation.bracket",
    "@punctuation.delimiter",
    "@operator",
    -- Language specific
    "@type.typescript",
    "@function.typescript",
    "@string.typescript",
    -- Legacy
    "Type",
    "Function",
    "String",
    "Keyword",
    "Operator",
    "Delimiter",
  }
  
  print("Highlight Groups:")
  print(string.format("%-30s %-15s %s", "Group", "Actual Color", "Expected Color"))
  print(string.rep("-", 60))
  
  for _, group in ipairs(groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group })
    local expected = theme_mappings.get_mapping(palette_name, group)
    
    if hl.fg then
      local actual = string.format("#%06x", hl.fg)
      print(string.format("%-30s %-15s %s", group, actual, expected or "(default)"))
    else
      print(string.format("%-30s %-15s %s", group, "(not set)", expected or "(default)"))
    end
  end
  
  -- Check Tree-sitter status
  print("\nTree-sitter Status:")
  local has_ts = pcall(require, 'nvim-treesitter')
  print("Tree-sitter available: " .. tostring(has_ts))
  
  if has_ts then
    local parsers = require('nvim-treesitter.parsers')
    local ft = vim.bo.filetype
    print("Current filetype: " .. (ft ~= "" and ft or "(none)"))
    print("Parser installed: " .. tostring(parsers.has_parser(ft)))
    
    local installed = parsers.available_parsers()
    if #installed > 0 then
      print("Installed parsers: " .. table.concat(installed, ", "))
    else
      print("No parsers installed")
    end
  end
end

return M