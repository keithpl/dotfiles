local treesitter_langs = {
    "bash",
    "c",
    "diff",
    "gitcommit",
    "go",
    "lua",
    "python",
    "query",
    "rust",
    "toml",
    "vim",
    "vimdoc",
    "yaml"
}

local function treesitter_config()
    local tsconf = require("nvim-treesitter.configs")

    tsconf.setup({
        ensure_installed = treesitter_langs,
        auto_install = true,
        sync_install = false,
        indent = {
            enable = false
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    })

    -- Utilize bash highlighting rules for zsh as zsh support is severely
    -- lacking in tree-sitter at the moment.
    vim.treesitter.language.register("bash", "zsh")
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = treesitter_config
}
