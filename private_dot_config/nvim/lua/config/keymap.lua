local lsp_mappings = augroup("lsp-mappings", { clear = true })

local function nnoremap(lhs, rhs, opts)
    vim.keymap.set("n", lhs, rhs, opts)
end

vim.g.mapleader = " "

nnoremap("Q", "<nop>")
nnoremap("ZZ", "<nop>")
nnoremap("ZQ", "<nop>")

nnoremap("<leader>ls", "<cmd>Lazy sync<cr>")

nnoremap("Y", "y$")
nnoremap("<leader>j", "<cmd>m .+1<cr>==")
nnoremap("<leader>k", "<cmd>m .-2<cr>==")

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

nnoremap("<leader>tt", "<cmd>NvimTreeToggle<cr>")
nnoremap("<leader>tr", "<cmd>NvimTreeRefresh<cr>")

autocmd("LspAttach", {
    group = lsp_mappings,
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        nnoremap("gd", vim.lsp.buf.definition, opts)
        nnoremap("gD", vim.lsp.buf.declaration, opts)
        nnoremap("K", vim.lsp.buf.hover, opts)
    end
})
