local function gruvbox_baby_config()
    vim.g.gruvbox_baby_background_color = "dark"
    vim.g.gruvbox_baby_keyword_style = "NONE"

    vim.cmd("colorscheme gruvbox-baby")
end

return {
    "luisiacc/gruvbox-baby",
    lazy = false,
    priority = 1000,
    config = gruvbox_baby_config
}
