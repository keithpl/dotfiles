vim.g.gruvbox_baby_background_color = "dark"
vim.g.gruvbox_baby_transparent_mode = false
vim.g.gruvbox_baby_keyword_style = "NONE"
vim.g.gruvbox_baby_use_original_palette = false

vim.g.gruvbox_baby_highlights = {
    Whitespace = {
        fg = "#504945"
    },
    DiffText = {
        bg = "#be9d15",
        fg = "#0d0e0f"
    }
}

vim.cmd("silent! colorscheme gruvbox-baby")
