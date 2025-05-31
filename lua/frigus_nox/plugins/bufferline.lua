--- Frigus Nox for bufferline
--- https://github.com/akinsho/bufferline.nvim
---
--- @usage
--- local highlights = require("frigus_nox.plugins.bufferline")
--- require("bufferline").setup({ highlights = highlights })

local p = require("frigus_nox.palette")

return {
    fill = {
        bg = p.bg,
    },
    background = {
        fg = p.grey,
        bg = p.bg,
    },
    tab = {
        fg = p.grey,
        bg = p.bg,
    },
    tab_selected = {
        fg = p.white,
        bg = p.bg,
        bold = true,
    },
    tab_close = {
        fg = p.grey,
        bg = p.bg,
    },
    close_button = {
        fg = p.grey,
        bg = p.bg,
    },
    close_button_visible = {
        fg = p.grey,
        bg = p.bg,
    },
    close_button_selected = {
        fg = p.white,
        bg = p.bg,
    },
    buffer_visible = {
        fg = p.grey,
        bg = p.bg,
    },
    buffer_selected = {
        fg = p.white,
        bg = p.bg,
        bold = true,
        italic = true,
    },
    modified = {
        fg = p.green,
        bg = p.bg,
    },
    modified_visible = {
        fg = p.green,
        bg = p.bg,
    },
    modified_selected = {
        fg = p.green,
        bg = p.bg,
    },
    separator = {
        fg = p.grey,
        bg = p.bg,
    },
    separator_visible = {
        fg = p.grey,
        bg = p.bg,
    },
    separator_selected = {
        fg = p.grey,
        bg = p.bg,
    },
    indicator_selected = {
        fg = p.green,
        bg = p.bg,
    },
    pick = {
        fg = p.green,
        bg = p.bg,
        bold = true,
    },
    pick_visible = {
        fg = p.green,
        bg = p.bg,
        bold = true,
    },
    pick_selected = {
        fg = p.green,
        bg = p.bg,
        bold = true,
    },
    duplicate = {
        fg = p.grey,
        bg = p.bg,
    },
    duplicate_selected = {
        fg = p.grey,
        bg = p.bg,
    },
    duplicate_visible = {
        fg = p.grey,
        bg = p.bg,
    },
} 