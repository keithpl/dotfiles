local lsp_keymap = vim.api.nvim_create_augroup("lsp-keymap", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_keymap,
    callback = function(ev)
        local opts = {
            buffer = ev.buf
        }

        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end
})

local lsp_clangd_flags = {
    "-xc", "-std=c17", "-Wall", "-Wextra", "-pedantic", "-pedantic-errors",
    "-Wformat=2", "-Wshadow", "-Wstrict-prototypes", "-Wstrict-overflow=2",
    "-Wvla", "-Wredundant-decls", "-Wnested-externs", "-Wcast-qual",
    "-Wfloat-equal", "-Wdouble-promotion", "-Wpointer-arith", "-Wundef",
    "-Winit-self", "-Wwrite-strings", "-Wno-unused-function",
    "-Wno-empty-translation-unit"
}

local function lsp_config()
    local lspconfig = require("lspconfig")

    lspconfig.bashls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.rust_analyzer.setup({})

    lspconfig.clangd.setup({
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion-decorators=false"
        },
        init_options = {
            fallbackFlags = lsp_clangd_flags
        }
    })

    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                },
                telemetry = {
                    enable = false
                }
            }
        }
    })
end

return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = lsp_config
}
