return {
    {
        "tpope/vim-fugitive",
        lazy = false
    },

    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        opts = {}
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
        main = "ibl",
        opts = {}
    },

    {
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {}
    },

    {
        "j-hui/fidget.nvim",
        lazy = false,
        opts = {}
    },

    {
        "mbbill/undotree",
        lazy = true,
        keys = {
            { "<leader>ut", vim.cmd.UndotreeToggle }
        }
    }
}
