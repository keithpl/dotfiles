local lualine = require("lualine")
local nvim_web_devicons = require("nvim-web-devicons")

nvim_web_devicons.setup()

lualine.setup {
    options = {
        theme = "gruvbox_dark",
        component_separators = {
            left = "|",
            right = "|"
        },
        section_separators = {
            left = "",
            right = ""
        }
    }
}
