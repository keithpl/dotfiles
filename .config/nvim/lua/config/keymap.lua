vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "Z", "<nop>")
vim.keymap.set("n", "ZQ", "<nop>")
vim.keymap.set("n", "ZZ", "<nop>")

vim.keymap.set("n", "<leader>j", "<cmd>m . +1<cr>==")
vim.keymap.set("n", "<leader>k", "<cmd>m . -2<cr>==")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

local lsp_keymap = vim.api.nvim_create_augroup("lsp-keymap", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_keymap,
    callback = function(ev)
        local opts = {
            buffer = ev.buf
        }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end
})
