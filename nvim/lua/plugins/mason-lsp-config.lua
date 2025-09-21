-- mason plugin (Neovim 0.11+ / nvim-lspconfig 2.x)

return {

	-- Mason core (new org)
	{ "mason-org/mason.nvim", opts = {} },

	-- Mason ↔ LSP bridge (now auto-enables via vim.lsp.enable)
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			-- install what you actually use
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"pyright",
				"ts_ls", -- tsserver was renamed
				"asm_lsp",
				"zls",
				"gopls",
				"hls",
				"wasm_language_tools",
				-- "jdtls",            -- see note about Java
				-- "sourcekit",        -- Swift (uses Xcode’s sourcekit-lsp)
				-- "csharp_ls",
			},
			-- default = true; leave it on unless you want to manage enables yourself
			automatic_enable = true,
		},
	},

	-- nvim-lspconfig: data-only; use vim.lsp.config/enable now
	{
		"neovim/nvim-lspconfig",
		init = function()
			-- Advertise nvim-cmp capabilities to ALL servers
			local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", { capabilities = cmp_caps }) -- wildcard applies to every server

			-- Per-server tweaks / overrides (optional)
			vim.lsp.config("asm_lsp", {
				-- widen filetype detection if you want
				filetypes = { "asm", "nasm", "gas", "s", "S" },
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			-- Example: Java is special; prefer mfussenegger/nvim-jdtls.
			-- If you *really* want to start jdtls via lspconfig you must set cmd:
			-- vim.lsp.config("jdtls", { cmd = { "/absolute/path/to/jdtls" } })
			-- and then enable it or let Mason auto-enable.
		end,
	},
}
