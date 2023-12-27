local function nvim_tree_config()
    local nvim_tree = require("nvim-tree")
    local nvim_tree_api = require("nvim-tree.api")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.keymap.set("n", "<leader>tt", nvim_tree_api.tree.toggle)
    vim.keymap.set("n", "<leader>tr", nvim_tree_api.tree.reload)

    nvim_tree.setup({})
end

return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = nvim_tree_config
}
