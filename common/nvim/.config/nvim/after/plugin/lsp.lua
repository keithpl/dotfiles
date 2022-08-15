local cmp = require("cmp")
local luasnip = require("luasnip")
local lspconfig = require("lspconfig")
local lspcaps = vim.lsp.protocol.make_client_capabilities()

local clangd_fallback_flags = {
    "-xc", "-std=c18", "-Wall", "-Wextra", "-pedantic", "-pedantic-errors",
    "-Wformat=2", "-Wshadow", "-Wstrict-prototypes", "-Wstrict-overflow=2",
    "-Wredundant-decls", "-Wnested-externs", "-Wfloat-equal", "-Wpointer-arith",
    "-Wvla", "-Wundef", "-Wcast-qual", "-Winit-self", "-Wwrite-strings",
    "-Wlogical-op", "-Wno-unused-function", "-Wno-empty-translation-unit"
}

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
        ["<S-Tab>"] = cmp.mapping.confirm {
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" }
    }
})

lspconfig.bashls.setup({ capabilities = lspcaps })

lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    capabilities = lspcaps,
    init_options = {
        fallbackFlags = clangd_fallback_flags
    }
})

lspconfig.pyright.setup({ capabilities = lspcaps })

lspconfig.rust_analyzer.setup({ capability = lspcaps })

lspconfig.sumneko_lua.setup({
    capabilities = lspcaps,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})
