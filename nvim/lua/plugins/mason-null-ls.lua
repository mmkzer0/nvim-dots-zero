-- lua/plugins/mason-null-ls.lua
--
return {

	"jay-babu/mason-null-ls.nvim",
	dependencies = { "nvimtools/none-ls.nvim", "mason-org/mason.nvim" },
	event = "BufReadPre", -- ensure tools are wired before first attach
	opts = {
		-- tools I actually use (diagnostics & code-actions; leave formatting to Conform)
		ensure_installed = {
			"shfmt", -- used by Conform for sh formatting
			"black",
			"isort", -- Conform
			"stylua", -- Conform
			"biome",
			"prettierd",
			"jq",
			"hadolint",
			"rubocop",
			"clang-format", -- Conform
		},
		automatic_installation = true,
		handlers = {}, -- default auto-register into none-ls
	},
}
