local function tokyonight_config()
    local tokyonight = require("tokyonight")

    tokyonight.setup({
        style = "moon",
        styles = {
            keywords = {
                italic = false
            },
            functions = {
                bold = true
            }
        },
        on_colors = function(colors)
            colors.bg = "#202232"
        end
    })

    vim.cmd("colorscheme tokyonight")
end

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = tokyonight_config
}
