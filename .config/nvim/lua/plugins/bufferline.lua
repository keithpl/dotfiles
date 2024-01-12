local function bufferline_config()
    local bufferline = require("bufferline")

    bufferline.setup({
        options = {
            offsets = {
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
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = bufferline_config
}
