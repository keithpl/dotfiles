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

local lazy_plugins = {
    { "folke/lazy.nvim" },

    { "luisiacc/gruvbox-baby", priority = 1000 },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-lualine/lualine.nvim" },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-treesitter/playground" },

    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "windwp/nvim-autopairs" },
    { "folke/trouble.nvim" },

    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },

    { "mbbill/undotree" },
    { "tpope/vim-fugitive" }
}

local lazy_opts = {}

require("lazy").setup(lazy_plugins, lazy_opts)
