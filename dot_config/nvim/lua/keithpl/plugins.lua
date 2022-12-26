local function packer_ensure()
    local fn = vim.fn
    local url = "https://github.com/wbthomason/packer.nvim"
    local path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", url, path })
        vim.cmd("packadd packer.nvim")
        return true
    end
    return false
end

local packer_bootstrap = packer_ensure()

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("luisiacc/gruvbox-baby")
    use("norcalli/nvim-colorizer.lua")

    use("windwp/nvim-autopairs")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")

    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdateSync" })
    use("nvim-treesitter/playground")

    use("nvim-lualine/lualine.nvim")
    use("kyazdani42/nvim-web-devicons")

    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")

    use("Vimjas/vim-python-pep8-indent")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
