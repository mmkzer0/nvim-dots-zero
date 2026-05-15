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
		},
		automatic_installation = true,
		handlers = {
			-- Formatters are managed by Conform; prevent auto-registration into none-ls
			shfmt = function() end,
			black = function() end,
			isort = function() end,
			stylua = function() end,
			biome = function() end,
			prettierd = function() end,
			jq = function() end,
			-- hadolint and rubocop: default handler registers them into none-ls
		},
	},
}
