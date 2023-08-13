local function statusline_config()
    local lualine = require("lualine")

    lualine.setup({
        options = {
            icons_enabled = true,
            theme = "tokyonight",
            component_separators = {
                left = "|",
                right = "|"
            },
            section_separators = {
                left = "",
                right = ""
            },
            disabled_filetypes = {
                "undotree",
                "NvimTree"
            }
        }
    })
end

return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = statusline_config
}
