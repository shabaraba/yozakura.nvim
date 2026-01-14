--- Configuration management for Yozakura colorscheme
--- @module yozakura.config
local M = {}

--- Default configuration options
--- @type table
local defaults = {
  transparent = false,
  italic_comments = true,
  dim_inactive = false,
  palette = "warm_gray", -- "teal_night" | "warm_gray" | "muted_rose" | "night_blue"
  styles = {
    comments = { italic = true },
    keywords = { italic = false },
    functions = { italic = false },
    variables = { italic = false },
  },
}

M.options = vim.deepcopy(defaults)

--- Setup configuration with user options
--- @param opts table|nil User configuration options
--- @return nil
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

--- Get current configuration
--- @return table Current configuration options
function M.get()
  return M.options
end

return M