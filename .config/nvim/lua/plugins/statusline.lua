local function statusline_config()
    local lualine = require("lualine")

    lualine.setup({
        options = {
            icons_enabled = true,
            theme = "sonokai",
            section_separators = "",
            component_separators = "|",
            disabled_filetypes = {
                "NvimTree",
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
    config = statusline_config
}
