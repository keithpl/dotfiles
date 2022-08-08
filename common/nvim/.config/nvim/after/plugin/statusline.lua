local lualine = require("lualine")
local nvim_web_devicons = require("nvim-web-devicons")
local gruvbox_baby_custom = require("lualine.themes.gruvbox-baby")
local gruvbox_baby_colors = require("gruvbox-baby.colors").config()

nvim_web_devicons.setup()

gruvbox_baby_custom.normal.c.bg = gruvbox_baby_colors.background_dark
gruvbox_baby_custom.inactive.b.bg = gruvbox_baby_colors.background
gruvbox_baby_custom.inactive.c.bg = gruvbox_baby_colors.background_dark

lualine.setup({
    options = {
        theme = gruvbox_baby_custom,
        component_separators = {
            left = "|",
            right = "|"
        },
        section_separators = {
            left = "",
            right = ""
        }
    }
})
