local options = require("frigus_nox.config").options

local palette = {
  bg = '#2c3037',
  white = '#e7e9eb',
  green = '#79c3ab',
  blue = '#6d95c0',
  yellow = '#eeac4d',
  grey = '#363b44',
  purple = '#5b256d',
  active = '#377565',
  _nc = '#21252b',
  red = '#f23b3b',
  surface = '#21252b',
  overlay = '#3a4f6b',
  muted = '#858585',
  subtle = '#c6c6c6',
  text = '#e7e9eb',
  highlight_low = '#21252b',
  highlight_med = '#3a4f6b',
  highlight_high = '#587584',
  black = '#000000',
  none = "NONE",
}

if options.palette ~= nil and next(options.palette) then
  palette = vim.tbl_extend("force", palette, options.palette)
end

return palette 