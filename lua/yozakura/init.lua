local M = {}
local config = require("yozakura.config")

function M.setup(opts)
  config.setup(opts)
  -- Auto-apply colorscheme when setup is called
  vim.cmd("colorscheme yozakura")
end

function M.load()
  require("yozakura.theme").load()
end

function M.set_palette(palette_name)
  if palette_name and palette_name ~= "" then
    config.options.palette = palette_name
  else
    config.options.palette = "warm_gray"
  end
  M.load()
  print("🌸 Yozakura palette set to: " .. (config.options.palette or "warm_gray"))
end

function M.yozakura(args)
  if args == "hello" then
    print("🌸 Hello from yozakura.nvim!")
  else
    print("🌸 yozakura.nvim is loaded")
  end
end

return M