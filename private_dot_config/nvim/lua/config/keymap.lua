vim.g.mapleader = " "

vim.keymap.set("n", "Q", "<Nop>")
vim.keymap.set("n", "Z", "<Nop>")
vim.keymap.set("n", "ZZ", "<Nop>")
vim.keymap.set("n", "ZQ", "<Nop>")

vim.keymap.set("n", "<leader>j", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<leader>k", "<cmd>m .-2<cr>==")

vim.keymap.set("n", "<leader>ls", "<cmd>Lazy sync<cr>")
