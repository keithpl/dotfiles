local function packer_install()
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

local packer_bootstrap = packer_install()

local packer = require("packer")

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    use("luisiacc/gruvbox-baby")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")

    use("neovim/nvim-lspconfig")
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdateSync" })
    use("nvim-treesitter/playground")

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lsp")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("windwp/nvim-autopairs")

    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")

    use("Vimjas/vim-python-pep8-indent")

    if packer_bootstrap then
        packer.sync()
    end
end)
