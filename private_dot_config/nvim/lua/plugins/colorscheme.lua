local function colorscheme_config()
    local tokyonight = require("tokyonight")

    tokyonight.setup({
        style = "night",
        styles = {
            keywords = {
                italic = false
            },
            functions = {
                bold = true
            }
        }
    })

    vim.cmd("colorscheme tokyonight")
end

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = colorscheme_config
}
