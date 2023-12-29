local lsp_keymap = vim.api.nvim_create_augroup("lsp-keymap", {
    clear = true
})

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

local lsp_clangd_fallbackflags = {
    "-xc", "-std=c17", "-Wall", "-Wextra", "-pedantic", "-pedantic-errors",
    "-Wformat=2", "-Wshadow", "-Wstrict-prototypes", "-Wstrict-overflow=2",
    "-Wvla", "-Wredundant-decls", "-Wnested-externs", "-Wcast-qual",
    "-Wfloat-equal", "-Wdouble-promotion", "-Wpointer-arith", "-Wundef",
    "-Winit-self", "-Wwrite-strings", "-Wno-unused-function",
    "-Wno-empty-translation-unit"
}

local lsp_server_configs = {
    bashls = {},
    pyright = {},
    rust_analyzer = {},

    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion-decorators=false"
        },
        init_options = {
            fallbackFlags = lsp_clangd_fallbackflags
        }
    },

    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                },
                telemetry = {
                    enable = false
                },
                workspace = {
                    checkThirdParty = false
                }
            }
        }
    }
}

local function lsp_config()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")
    local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

    lsp_capabilities = cmp_nvim_lsp.default_capabilities(lsp_capabilities)

    local function lsp_configure_server(server, config)
        config.capabilities = lsp_capabilities
        lspconfig[server].setup(config)
    end

    for name, config in pairs(lsp_server_configs) do
        lsp_configure_server(name, config)
    end
end

return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = lsp_config
}
