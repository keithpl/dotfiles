local clangd_fallbackflags = {
    "-xc", "-std=c17",
    "-Wall", "-Wextra", "-pedantic", "-pedantic-errors", "-Wformat=2",
    "-Wshadow", "-Wstrict-prototypes", "-Wstrict-overflow=2", "-Wvla",
    "-Wredundant-decls", "-Wnested-externs", "-Wcast-qual", "-Wfloat-equal",
    "-Wdouble-promotion", "-Wpointer-arith", "-Wundef", "-Winit-self",
    "-Wwrite-strings", "-Wno-unused-function", "-Wno-empty-translation-unit"
}

local lsp_server_configs = {
    bashls = {},
    pyright = {},
    rust_analyzer = {},

    clangd = {
        cmd = {
            "clangd",
            "--clang-tidy",
            "--header-insertion-decorators=false"
        },
        init_options = {
            fallbackFlags = clangd_fallbackflags
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
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local function lsp_configure_server(server, config)
        config.capabilities = capabilities
        lspconfig[server].setup(config)
    end

    for name, config in pairs(lsp_server_configs) do
        lsp_configure_server(name, config)
    end
end

return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = lsp_config
}
