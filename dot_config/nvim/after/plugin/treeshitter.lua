local res
local nvim_tree
local ts_configs

res, ts_configs = pcall(require, "nvim-treesitter.configs")
if not res then
    vim.notify("Failed to load nvim-treesitter lua module")
    return
end

res, nvim_tree = pcall(require, "nvim-tree")
if res then
    nvim_tree.setup()
end

ts_configs.setup({
    auto_install = true,
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    sync_install = false,
    indent = {
        enable = false
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false
    }
})
