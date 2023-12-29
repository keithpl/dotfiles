local treeshitter_langs = {
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

local function treeshitter_config()
    local tsconf = require("nvim-treesitter.configs")

    tsconf.setup({
        ensure_installed = treeshitter_langs,
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

    -- Use bash highlighting rules for zsh as zsh support is severely
    -- lacking at the moment.
    vim.treesitter.language.register("bash", "zsh")
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = treeshitter_config
}
