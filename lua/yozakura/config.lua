local M = {}

local defaults = {
  transparent = false,
  italic_comments = true,
  dim_inactive = false,
  palette = "soft_contrast", -- "soft_contrast" | "warm_gray" | "muted_rose" | "night_blue"
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { italic = false },
    variables = { italic = false },
  },
}

M.options = vim.deepcopy(defaults)

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

function M.get()
  return M.options
end

return M