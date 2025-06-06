local M = {}

M.options = {
  styles = {},
  groups = {},
  palette = {},
}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M