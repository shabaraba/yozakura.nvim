--- Theme loader for Yozakura colorscheme
--- Handles loading compiled highlights and setting terminal colors
--- @module yozakura.theme
local M = {}

--- Load the colorscheme with the current palette
--- Applies highlights and configures terminal colors
--- @return nil
function M.load()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "yozakura"

  local config = require("yozakura.config").get()
  local palette_name = config.palette or "warm_gray"

  -- Load compiled highlights (generated from lush theme)
  local compiled = require(string.format("yozakura.compiled.%s", palette_name))
  local highlights = compiled.setup()

  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
  
  -- Force Tree-sitter highlights if available
  if vim.fn.has('nvim-0.8') == 1 then
    vim.api.nvim_create_autocmd('FileType', {
      pattern = '*',
      callback = function()
        vim.schedule(function()
          if vim.bo.filetype ~= '' then
            vim.cmd('doautocmd Syntax')
          end
        end)
      end
    })
  end
  
  -- Terminal colors
  local palette = require("yozakura.palette").setup({ palette = palette_name })
  vim.g.terminal_color_0 = palette.bg0
  vim.g.terminal_color_1 = palette.red
  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_3 = palette.yellow
  vim.g.terminal_color_4 = palette.blue
  vim.g.terminal_color_5 = palette.purple
  vim.g.terminal_color_6 = palette.cyan
  vim.g.terminal_color_7 = palette.fg1
  vim.g.terminal_color_8 = palette.bg3
  vim.g.terminal_color_9 = palette.red
  vim.g.terminal_color_10 = palette.green
  vim.g.terminal_color_11 = palette.yellow
  vim.g.terminal_color_12 = palette.blue
  vim.g.terminal_color_13 = palette.purple
  vim.g.terminal_color_14 = palette.cyan
  vim.g.terminal_color_15 = palette.fg0
end

return M