local res
local nvim_tree

res, nvim_tree = pcall(require, "nvim-tree")
if not res then
    vim.notify("Failed to load lua module: nvim-tree")
    return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup()
