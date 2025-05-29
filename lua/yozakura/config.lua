local M = {}

local defaults = {
  transparent = false,
  italic_comments = true,
  dim_inactive = false,
  palette = nil, -- nil | "soft_contrast" | "warm_gray" | "muted_rose" | "night_blue"
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { italic = false },
    variables = { italic = false },
  },
}

M.options = {}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", defaults, opts or {})
end

function M.get()
  return M.options
end

return M