-- Simple plugins that don't any advanced configuration or dependencies, or I
-- just like the defaults.

return {
    { "tpope/vim-fugitive" },
    { "j-hui/fidget.nvim" },
    { "lewis6991/gitsigns.nvim", opts = {} },
    { "numToStr/Comment.nvim", opts = {} },
    { "akinsho/bufferline.nvim", opts = {} },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
}
