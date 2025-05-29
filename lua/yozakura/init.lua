local M = {}
local config = require("yozakura.config")

function M.setup(opts)
  config.setup(opts)
  -- Don't auto-apply colorscheme in setup, let user do it explicitly
  -- This allows proper opts handling in Lazy.nvim
end

function M.load()
  require("yozakura.theme").load()
end

function M.set_palette(palette_name)
  if palette_name and palette_name ~= "" then
    config.options.palette = palette_name
  else
    config.options.palette = "soft_contrast"
  end
  M.load()
  print("🌸 Yozakura palette set to: " .. (config.options.palette or "soft_contrast"))
end

function M.yozakura(args)
  if args == "hello" then
    print("🌸 Hello from yozakura.nvim!")
  else
    print("🌸 yozakura.nvim is loaded")
  end
end

return M