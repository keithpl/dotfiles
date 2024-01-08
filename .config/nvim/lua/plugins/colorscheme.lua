local function sonokai_config()
    vim.g.sonokai_style = "atlantis"
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_diagnostic_virtual_text = "colored"
    vim.g.sonokai_enable_italic = 0
    vim.g.sonokai_disable_italic_comment = 0
    vim.g.sonokai_transparent_background = 0

    vim.cmd("colorscheme sonokai")
end

return {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = sonokai_config
}
