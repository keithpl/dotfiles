local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nnoremap(lhs, rhs, opts)
    map("n", lhs, rhs, opts)
end

vim.g.mapleader = " "

nnoremap("ZZ", "<nop>")
nnoremap("ZQ", "<nop>")

nnoremap("<leader>ps", "<cmd>PackerSync<cr>")

nnoremap("Y", "y$")
nnoremap("<leader>j", "<cmd>m .+1<cr>==")
nnoremap("<leader>k", "<cmd>m .-2<cr>==")

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
