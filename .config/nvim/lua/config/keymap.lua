vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "Q", "<NOP>")
vim.keymap.set("n", "Z", "<NOP>")
vim.keymap.set("n", "ZZ", "<NOP>")
vim.keymap.set("n", "ZQ", "<NOP>")

vim.keymap.set("n", "<leader>j", "<cmd>m . +1<cr>==")
vim.keymap.set("n", "<leader>k", "<cmd>m . -2<cr>==")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
