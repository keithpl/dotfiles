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

local function packer_plugins(use)
    use("wbthomason/packer.nvim")

    use("luisiacc/gruvbox-baby")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({
                with_sync = true
            })
            ts_update()
        end
    })

    use("nvim-treesitter/playground")
    use("neovim/nvim-lspconfig")

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
end

return packer.startup({
    packer_plugins,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end
        }
    }
})
