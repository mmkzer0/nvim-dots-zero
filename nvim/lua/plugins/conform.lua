-- lua/plugins/conform.lua

return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = function(buf)
			local skip = { "sql" }
			if vim.tbl_contains(skip, vim.bo[buf].filetype) then
				return
			end
			return { lsp_fallback = true, timeout_ms = 1000 }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" }, -- or ruff_* if you prefer ruff
			javascript = { "biome", "prettierd", "prettier" },
			typescript = { "biome", "prettierd", "prettier" },
			json = { "biome", "jq" },
			yaml = { "prettierd", "prettier" },
			sh = { "shfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			rust = { "rustfmt" },
		},
	},
}
