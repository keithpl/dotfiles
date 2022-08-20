local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    indent = {
        enable = false
    }
})
