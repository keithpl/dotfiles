local lsp_mappings = augroup("lsp-mappings", { clear = true })

vim.g.mapleader = " "

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "ZZ", "<nop>")
vim.keymap.set("n", "ZQ", "<nop>")

vim.keymap.set("n", "<leader>ls", "<cmd>Lazy sync<cr>")

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<leader>j", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<leader>k", "<cmd>m .-2<cr>==")

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<cr>")

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")

autocmd("LspAttach", {
    group = lsp_mappings,
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end
})
