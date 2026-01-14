--- Debug utilities for Yozakura colorscheme
--- @module yozakura.debug
local M = {}

--- Display current highlight groups and their colors
--- Useful for debugging theme issues and verifying color application
--- @return nil
function M.show_highlights()
  local config = require("yozakura.config").get()
  local palette_name = config.palette or "warm_gray"

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
  print(string.format("%-30s %-15s", "Group", "Actual Color"))
  print(string.rep("-", 50))

  for _, group in ipairs(groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group })

    if hl.fg then
      local actual = string.format("#%06x", hl.fg)
      print(string.format("%-30s %-15s", group, actual))
    else
      print(string.format("%-30s %-15s", group, "(not set)"))
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