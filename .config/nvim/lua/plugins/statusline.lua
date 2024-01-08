local function lualine_config()
    local lualine = require("lualine")

    lualine.setup({
        options = {
            icons_enabled = true,
            theme = "sonokai",
            section_separators = "",
            component_separators = "|",
            disabled_filetypes = {
                "undotree"
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
    config = lualine_config
}
