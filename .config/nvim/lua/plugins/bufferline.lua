local function bufferline_config()
    local bufferline = require("bufferline")

    bufferline.setup({
        options = {
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "NvimTree",
                    highlight = "Directory",
                    separator = false
                },

                {
                    filetype = "undotree",
                    text = "UndoTree",
                    separator = false
                }
            }
        }
    })
end

return {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = bufferline_config
}
