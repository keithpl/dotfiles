local res
local cmp
local luasnip
local autopairs

res, autopairs = pcall(require, "nvim-autopairs")
if res then
    autopairs.setup()
end

res, cmp = pcall(require, "cmp")
if not res then
    vim.notify("Failed to load nvim-cmp lua module")
    return
end

res, luasnip = pcall(require, "luasnip")
if not res then
    vim.notify("Failed to load luasnip lua module")
    return
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<S-Tab>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        })
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" }
    }
})
