local M = {}

M.options = {
  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },
  groups = {
    border = "#363b44",
    link = "#6d95c0",
    panel = "#21252b",
    error = "#f48771",
    hint = "#89ddff",
    info = "#82aaff",
    ok = "#79c3ab",
    warn = "#ef9732",
    git_add = "#335533",
    git_change = "#555533",
    git_delete = "#553333",
    git_text = "#777755",
    h1 = "#6d95c0",
    h2 = "#79c3ab",
    h3 = "#ffbc03",
    h4 = "#f48771",
    h5 = "#89ddff",
    h6 = "#82aaff",
  },
  dim_inactive_windows = false,
  extend_background_behind_borders = false,
  palette = {},
}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M 