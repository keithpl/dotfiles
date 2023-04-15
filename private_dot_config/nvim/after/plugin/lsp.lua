local res
local lspconfig

local clangd_fallback_flags = {
    "-xc", "-std=c17", "-Wall", "-Wextra", "-pedantic", "-pedantic-errors",
    "-Wformat=2", "-Wshadow", "-Wstrict-prototypes", "-Wstrict-overflow=2",
    "-Wvla", "-Wredundant-decls", "-Wnested-externs", "-Wcast-qual",
    "-Wfloat-equal", "-Wdouble-promotion", "-Wpointer-arith", "-Wundef",
    "-Winit-self", "-Wwrite-strings", "-Wlogical-op", "-Wno-unused-function",
    "-Wno-empty-translation-unit"
}

res, lspconfig = pcall(require, "lspconfig")
if not res then
    vim.notify("Failed to load lua module: lspconfig")
    return
end

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
        fallbackFlags = clangd_fallback_flags
    }
})

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
                disable = { "lowercase-global" }
            },
            telemetry = {
                enable = false
            }
        }
    }
})
