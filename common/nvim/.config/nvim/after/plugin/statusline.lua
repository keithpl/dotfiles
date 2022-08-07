local lualine = require("lualine")
local nvim_web_devicons = require("nvim-web-devicons")

nvim_web_devicons.setup()

lualine.setup({
    options = {
--        theme = "tokyonight",
        theme = "gruvbox-baby",
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
