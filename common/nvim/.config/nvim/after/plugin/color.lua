local colorizer = require("colorizer")

-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_comments = true
-- vim.g.tokyonight_italic_keywords = false
-- vim.g.tokyonight_transparent = true

--vim.g.gruvbox_italic = 1
--vim.g.gruvbox_contrast_dark = "hard"
--vim.g.gruvbox_invert_selection = 0
--vim.g.gruvbox_improved_strings = 0
--vim.g.gruvbox_improved_warnings = 1

vim.g.gruvbox_baby_background_color = "dark"
vim.g.gruvbox_baby_transparent_mode = false
vim.g.gruvbox_baby_keyword_style = "NONE"
vim.g.gruvbox_baby_use_original_palette = false

vim.g.gruvbox_baby_highlights = {
    Whitespace = {
        fg = "#504945"
    },
    DiffText = {
        bg = "#eebd35",
        fg = "#0d0e0f"
    },
    DiffAdd = {
        bg = "#98971a",
        fg = "#0d0e0f"
    },
    DiffDelete = {
        bg = "#fb4934",
        fg = "#0d0e0f"
    },
}

--vim.cmd("colorscheme tokyonight")
--vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme gruvbox-baby")

colorizer.setup()
