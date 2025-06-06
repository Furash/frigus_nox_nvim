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

-- Helper function to blend two hex colors with given ratio
function M.blend_colors(fg, bg, ratio)
  -- parse hex color to r,g,b numbers (0-255)
  local function hex_to_rgb(hex)
    if not hex then return 0, 0, 0 end
    -- Handle "NONE" or empty strings
    if hex == "NONE" or hex == "" then return 0, 0, 0 end
    -- Ensure hex starts with #
    if hex:sub(1,1) ~= "#" then hex = "#" .. hex end
    -- Remove # and ensure we have 6 characters
    hex = hex:gsub("#","")
    if #hex < 6 then
      -- Pad with zeros if needed
      hex = hex .. string.rep("0", 6 - #hex)
    end
    return tonumber(hex:sub(1,2),16) or 0,
           tonumber(hex:sub(3,4),16) or 0,
           tonumber(hex:sub(5,6),16) or 0
  end

  local function rgb_to_hex(r,g,b)
    return string.format("#%02x%02x%02x", r, g, b)
  end

  -- Ensure we have valid colors and ratio
  fg = fg or "#000000"
  bg = bg or "#000000"
  ratio = ratio or 0.5

  local r1,g1,b1 = hex_to_rgb(fg)
  local r2,g2,b2 = hex_to_rgb(bg)

  local r = math.floor(r1 * ratio + r2 * (1 - ratio) + 0.5)
  local g = math.floor(g1 * ratio + g2 * (1 - ratio) + 0.5)
  local b = math.floor(b1 * ratio + b2 * (1 - ratio) + 0.5)

  return rgb_to_hex(r,g,b)
end

return M 