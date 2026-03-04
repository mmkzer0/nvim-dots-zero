-- lua/plugins/none-ls.lua

return {

	"nvimtools/none-ls.nvim",
	event = "BufReadPre",
	opts = function(_, opts)
		local nls = require("null-ls")
		opts = opts or {}
		-- only diagnostics / code-actions here (leave formatting to Conform)
		local sources = {
			nls.builtins.diagnostics.ruff,
			nls.builtins.diagnostics.shellcheck,
			nls.builtins.diagnostics.rubocop,
			nls.builtins.code_actions.gitsigns,
			-- no formatting sources here!
		}
		opts.sources = vim.tbl_extend("force", opts.sources or {}, sources)
		return opts
	end,
}
