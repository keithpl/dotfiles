local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "folke/lazy.nvim",
    "luisiacc/gruvbox-baby",
    "nvim-tree/nvim-tree.lua",
    "kyazdani42/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/playground",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "windwp/nvim-autopairs",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "Vimjas/vim-python-pep8-indent"
})
