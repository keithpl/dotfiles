local function undotree_config()
    vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
end

return {
    "mbbill/undotree",
    lazy = false,
    config = undotree_config
}
