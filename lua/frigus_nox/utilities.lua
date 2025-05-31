local M = {}

function M.parse_color(color)
  if type(color) == "string" then
    return color
  elseif type(color) == "table" then
    local result = {}
    for k, v in pairs(color) do
      if k == "fg" or k == "bg" or k == "sp" then
        result[k] = type(v) == "string" and v or tostring(v)
      else
        result[k] = v
      end
    end
    return result
  end
  return color
end

return M 