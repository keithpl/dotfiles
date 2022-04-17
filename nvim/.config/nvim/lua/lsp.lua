local lspconfig = require("lspconfig")
local lsp_caps = vim.lsp.protocol.make_client_capabilities()
local cmp_lsp_caps = require("cmp_nvim_lsp").update_capabilities(lsp_caps)

local cmp = require("cmp")

local clangd_fallback_flags = {
	"-xc", "-std=c18", "-Wall", "-Wextra", "-pedantic", "-pedantic-errors",
	"-Wformat=2", "-Wshadow", "-Wstrict-prototypes", "-Wstrict-overflow=2",
	"-Wredundant-decls", "-Wnested-externs", "-Wfloat-equal", "-Wpointer-arith",
	"-Wpadded", "-Wvla", "-Wcast-qual", "-Wundef", "-Winit-self",
	"-Wwrite-strings", "-Wno-unused-function", "-Wno-empty-translation-unit"
}

local function on_attach() end

vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "" })
vim.fn.sign_define("LspDiagnosticsSignError", { text = "" })

cmp.setup {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" }
	},
	mapping = {
		['<S-Tab>'] = cmp.mapping.confirm({select = true}),
		['<C-e>'] = cmp.mapping.close()
	}
}

require("nvim-autopairs").setup()

require("trouble").setup {
--	auto_open = true,
	auto_close = true
}

-- sudo pacman -S clang
lspconfig.clangd.setup {
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	on_attach = on_attach,
	capabilities = cmp_lsp_caps,
	init_options = {
		fallbackFlags = clangd_fallback_flags
	}
}

-- sudo pacman -S rust-analyzer
lspconfig.rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = cmp_lsp_caps
}

-- sudo pacman -S lua-language-server
lspconfig.sumneko_lua.setup {
	on_attach = on_attach,
	capabilities = cmp_lsp_caps,
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";")
			},
			diagnostics = {
				globals = { "vim" }
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				}
			}
		}
	}
}
