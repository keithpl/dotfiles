local configs = require("nvim-treesitter.configs")

configs.setup {
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    indent = {
        enable = false
    }
}