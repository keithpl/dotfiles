local function treesitter_config()
    local tsconfigs = require("nvim-treesitter.configs")

    local treesitter_langs = {
        "bash",
        "c",
        "go",
        "json",
        "lua",
        "python",
        "rust"
    }

    tsconfigs.setup({
        ensure_installed = treesitter_langs,
        auto_install = true,
        sync_install = true,
        indent = {
            enable = false
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    })

    -- Utilize bash syntax highlighting rules for zsh as zsh support is severly
    -- lacking in tree-sitter at the moment.
    vim.treesitter.language.register("bash", "zsh")
end

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = treesitter_config
}
