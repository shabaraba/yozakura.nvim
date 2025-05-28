local M = {}
local config = require("yozakura.config")

function M.setup(opts)
  config.setup(opts)
  vim.cmd("colorscheme yozakura")
end

function M.load()
  require("yozakura.theme").load()
end

function M.set_palette(palette_name)
  if palette_name and palette_name ~= "" then
    config.options.palette = palette_name
  else
    config.options.palette = nil
  end
  M.load()
  print("🌸 Yozakura palette set to: " .. (palette_name or "soft_contrast (default)"))
end

function M.yozakura(args)
  if args == "hello" then
    print("🌸 Hello from yozakura.nvim!")
  else
    print("🌸 yozakura.nvim is loaded")
  end
end

return M