local p = require("frigus_nox.palette")
local config = require("frigus_nox.config")

local bg_base = p.surface
if config.options.styles.transparency then
    bg_base = "NONE"
end

return {
    normal = {
        a = { bg = p.blue, fg = p.bg, gui = "bold" },
        b = { bg = p.overlay, fg = p.blue },
        c = { bg = bg_base, fg = p.text },
    },
    insert = {
        a = { bg = p.green, fg = p.bg, gui = "bold" },
        b = { bg = p.overlay, fg = p.green },
        c = { bg = bg_base, fg = p.text },
    },
    visual = {
        a = { bg = p.purple, fg = p.bg, gui = "bold" },
        b = { bg = p.overlay, fg = p.purple },
        c = { bg = bg_base, fg = p.text },
    },
    replace = {
        a = { bg = p.yellow, fg = p.bg, gui = "bold" },
        b = { bg = p.overlay, fg = p.yellow },
        c = { bg = bg_base, fg = p.text },
    },
    command = {
        a = { bg = p.active, fg = p.bg, gui = "bold" },
        b = { bg = p.overlay, fg = p.active },
        c = { bg = bg_base, fg = p.text },
    },
    inactive = {
        a = { bg = bg_base, fg = p.muted, gui = "bold" },
        b = { bg = bg_base, fg = p.muted },
        c = { bg = bg_base, fg = p.muted },
    },
} 