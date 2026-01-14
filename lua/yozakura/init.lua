--- Yozakura colorscheme - Main entry point
--- A beautiful Neovim colorscheme inspired by cherry blossoms at night
--- @module yozakura
local M = {}
local config = require("yozakura.config")

--- Setup Yozakura colorscheme with user options
--- @param opts table|nil Configuration options
--- @return nil
function M.setup(opts)
  config.setup(opts)
  -- Auto-apply colorscheme when setup is called
  vim.cmd("colorscheme yozakura")
end

--- Load the current colorscheme
--- @return nil
function M.load()
  require("yozakura.theme").load()
end

--- Switch to a different palette
--- @param palette_name string|nil Name of palette to switch to
--- @return nil
function M.set_palette(palette_name)
  if palette_name and palette_name ~= "" then
    config.options.palette = palette_name
  else
    config.options.palette = "warm_gray"
  end
  M.load()
  print("🌸 Yozakura palette set to: " .. (config.options.palette or "warm_gray"))
end

--- Yozakura command handler
--- @param args string Command arguments
--- @return nil
function M.yozakura(args)
  if args == "hello" then
    print("🌸 Hello from yozakura.nvim!")
  else
    print("🌸 yozakura.nvim is loaded")
  end
end

return M