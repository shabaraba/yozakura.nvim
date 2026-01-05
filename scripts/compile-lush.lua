#!/usr/bin/env -S nvim -l

-- ===================================================================
-- Lush to Lua/Vimscript Compiler
-- ===================================================================
-- This script compiles the lush colorscheme definition to standalone
-- Lua code that doesn't require lush.nvim at runtime.
-- ===================================================================

-- Add the project to the runtime path
vim.opt.runtimepath:prepend(vim.fn.getcwd())

-- Add lush.nvim to runtime path
local lush_path = vim.fn.expand("~/.local/share/nvim/lazy/lush.nvim")
if vim.fn.isdirectory(lush_path) == 1 then
  vim.opt.runtimepath:prepend(lush_path)
end

local function compile_theme()
  print("🌸 Compiling Yozakura lush theme...")

  -- Load lush
  local ok, lush = pcall(require, 'lush')
  if not ok then
    error("❌ lush.nvim not found. Please install it first:\n" ..
          "  Using lazy.nvim: { 'rktjmp/lush.nvim' }")
  end

  -- Get all available palettes
  local palette_module = require("yozakura.palette")
  local palettes = { "teal_night", "warm_gray", "muted_rose", "night_blue" }

  for _, palette_name in ipairs(palettes) do
    print(string.format("  Compiling palette: %s", palette_name))

    -- Set the palette in config
    local config = require("yozakura.config")
    config.options.palette = palette_name

    -- Reload the lush theme with this palette
    package.loaded['lush_theme.yozakura'] = nil
    local theme = require('lush_theme.yozakura')

    -- Write to output file
    local output_file = string.format("lua/yozakura/compiled/%s.lua", palette_name)
    local file = io.open(output_file, "w")
    if file then
      file:write("-- ===================================================================\n")
      file:write(string.format("-- Yozakura - %s palette\n", palette_name))
      file:write("-- Auto-generated from lush theme - DO NOT EDIT MANUALLY\n")
      file:write("-- To regenerate: ./scripts/compile-lush.lua\n")
      file:write("-- ===================================================================\n\n")
      file:write("local M = {}\n\n")
      file:write("function M.setup()\n")
      file:write("  local highlights = {\n")

      -- Extract all highlight groups from the lush theme
      for group_name, group_def in pairs(theme) do
        if type(group_name) == "string" and type(group_def) == "table" then
          local attrs = {}

          -- Extract colors and attributes
          if group_def.fg then
            table.insert(attrs, string.format('fg = "%s"', tostring(group_def.fg)))
          end
          if group_def.bg then
            table.insert(attrs, string.format('bg = "%s"', tostring(group_def.bg)))
          end
          if group_def.sp then
            table.insert(attrs, string.format('sp = "%s"', tostring(group_def.sp)))
          end

          -- Extract GUI attributes
          if group_def.gui then
            for attr in group_def.gui:gmatch("[^,]+") do
              attr = attr:match("^%s*(.-)%s*$") -- trim whitespace
              attrs[attr] = true
              table.insert(attrs, string.format('%s = true', attr))
            end
          end

          -- Write highlight definition
          if #attrs > 0 then
            file:write(string.format('    ["%s"] = { %s },\n', group_name, table.concat(attrs, ", ")))
          end
        end
      end

      file:write("  }\n")
      file:write("  return highlights\n")
      file:write("end\n\n")
      file:write("return M\n")
      file:close()
      print(string.format("    ✓ Generated: %s", output_file))
    else
      error(string.format("❌ Failed to write to %s", output_file))
    end
  end

  print("✨ Compilation complete!")
end

-- Create output directory if it doesn't exist
vim.fn.mkdir("lua/yozakura/compiled", "p")

-- Run compilation
local ok, err = pcall(compile_theme)
if not ok then
  print("❌ Compilation failed:")
  print(err)
  os.exit(1)
end

os.exit(0)
