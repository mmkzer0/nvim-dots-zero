-- mason plugin

return {

	{
		"williamboman/mason.nvim",
		lazy = true,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.asm_lsp.setup({
				capabilities = capabilities,
				filetypes = {
					"asm",
					"vmasm",
					"s",
					"S",
				},
			})
			lspconfig.zls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.java_language_server.setup({
				capabilitise = capabilities,
			})
			--lspconfig.arduino_language_server.setup({
			--capabilitise = capabilities,
			--})
			lspconfig.hls.setup({
				capabilitise = capabilities,
			})
			lspconfig.gopls.setup({
				capabilitise = capabilities,
			})
			lspconfig.wasm_language_tools.setup({
				capabilities = capabilities,
			})
			--lspconfig.sourcekit.setup({
			--	capabilitise = capabilities,
			--})
			--lspconfig.csharp_ls.setup({
			--capabilitise = capabilities,
			--cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
			--root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
			--})
		end,
	},
}
