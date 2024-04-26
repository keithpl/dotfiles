local function autocomplete_config()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local cmp_mapping = {
        ["<c-up>"] = cmp.mapping.select_prev_item(),
        ["<c-down>"] = cmp.mapping.select_next_item(),
        ["<s-up>"] = cmp.mapping.select_prev_item(),
        ["<s-down>"] = cmp.mapping.select_next_item(),
        ["<c-j>"] = cmp.mapping.select_prev_item(),
        ["<c-k>"] = cmp.mapping.select_next_item(),

        ["<c-e>"] = cmp.mapping.abort(),
        ["<cr>"] = cmp.mapping.confirm(),
        ["<s-tab>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        })
    }

    luasnip.config.setup()

    cmp.setup({
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        mapping = cmp_mapping,
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" }
        })
    })
end

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
    },
    config = autocomplete_config
}
