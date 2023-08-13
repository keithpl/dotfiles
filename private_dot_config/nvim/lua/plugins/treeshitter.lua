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
    "vim",
    "vimdoc",
    "yaml"
}

local function treeshitter_config()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
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
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = treeshitter_config
}
