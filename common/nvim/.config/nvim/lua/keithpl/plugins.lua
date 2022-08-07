local fn = vim.fn
local packer_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(packer_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        packer_path
    })

    vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("folke/tokyonight.nvim")
    use("luisiacc/gruvbox-baby")
    -- use("gruvbox-community/gruvbox")

    use("windwp/nvim-autopairs")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")

    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")

    use("nvim-lualine/lualine.nvim")
    use("kyazdani42/nvim-web-devicons")

    use("norcalli/nvim-colorizer.lua")

    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
end)
