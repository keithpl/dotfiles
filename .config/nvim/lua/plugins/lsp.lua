local clangd_config = {
    cmd = {
        "clangd",
        "--clang-tidy",
        "--header-insertion-decorators=false",
        "--function-arg-placeholders=false"
    },
    init_options = {
        fallbackFlags = {
            "-xc", "-std=c17",
            "-Wall", "-Wextra", "-pedantic", "-pedantic-errors", "-Wformat=2",
            "-Wshadow", "-Wstrict-prototypes", "-Wstrict-overflow=2", "-Wvla",
            "-Wredundant-decls", "-Wnested-externs", "-Wcast-qual",
            "-Wfloat-equal", "-Wdouble-promotion", "-Wpointer-arith",
            "-Wundef", "-Winit-self", "-Wwrite-strings",
            "-Wno-unused-function", "-Wno-empty-translation-unit"
        }
    }
}

local lua_ls_config = {
    settings = {
        Lua = {
            workspace = {
                maxPreload = 100000,
                preloadFileSize = 10000,
                checkThirdParty = false
            },
            telemetry = {
                enable = false
            }
        }
    },
    on_init = function(client)
        local path = client.workspace_folders[1].name

        if vim.loop.fs_stat(path .. "/.luarc.json") or
            vim.loop.fs_stat(path .. "/.luarc.jsonc") then
            return
        end

        client.config.settings.Lua =
            vim.tbl_deep_extend("force", client.config.settings.Lua, {
                diagnostics = {
                    globals = { "vim" }
                }
            })
    end
}

local lsp_server_configs = {
    bashls = {},
    gopls = {},
    pyright = {},
    rust_analyzer = {},

    clangd = clangd_config,
    lua_ls = lua_ls_config
}

local function lsp_config()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local function lsp_server_configure(server, config)
        config.capabilities = capabilities
        lspconfig[server].setup(config)
    end

    for name, config in pairs(lsp_server_configs) do
        lsp_server_configure(name, config)
    end
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = lsp_config
}
