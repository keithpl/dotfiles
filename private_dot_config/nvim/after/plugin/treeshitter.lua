local res
local ts_configs

res, ts_configs = pcall(require, "nvim-treesitter.configs")
if not res then
    vim.notify("Failed to load lua module: nvim-treesitter")
    return
end

ts_configs.setup({
    ensure_installed = {
        "bash", "c", "diff", "lua", "python", "query", "rust", "vim", "vimdoc"
    },
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
