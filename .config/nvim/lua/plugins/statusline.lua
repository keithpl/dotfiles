local function lualine_config()
    local lualine = require("lualine")

    lualine.setup({
        options = {
            icons_enabled = true,
            theme = "sonokai",
            section_separators = "",
            component_separators = "",
        },
        sections = {
            lualine_x = {
                "searchcount",
                "encoding",
                "fileformat",
                "filetype"
            }
        }
    })
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = lualine_config
}
