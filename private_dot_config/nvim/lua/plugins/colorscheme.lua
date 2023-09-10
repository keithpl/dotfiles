local function tokyonight_highlights(highlights, colors)
    local c_preproc = {
        fg = colors.red
    }

    highlights["@preproc.c"] = c_preproc
    highlights["@define.c"] = c_preproc
    highlights["@include.c"] = c_preproc

    highlights["@variable"] = {
        fg = colors.blue2
    }
end

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
        end,
        on_highlights = tokyonight_highlights
    })

    vim.cmd("colorscheme tokyonight")
end

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = tokyonight_config
}
