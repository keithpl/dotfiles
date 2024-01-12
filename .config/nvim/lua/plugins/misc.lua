-- Simple plugins that don't have any advanced configuration or dependencies.

return {
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim", opts = {} },
    { "numToStr/Comment.nvim", opts = {} },
    { "j-hui/fidget.nvim", opts = {} },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
}
