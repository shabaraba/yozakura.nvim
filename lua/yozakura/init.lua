local M = {}
local config = require("yozakura.config")

function M.setup(opts)
  config.setup(opts)
  vim.cmd("colorscheme yozakura")
end

function M.load()
  require("yozakura.theme").load()
end

function M.yozakura(args)
  if args == "hello" then
    print("🌸 Hello from yozakura.nvim!")
  else
    print("🌸 yozakura.nvim is loaded")
  end
end

return M