-- lua/plugins/none-ls.lua

return {
	"nvimtools/none-ls.nvim",
	opts = function(_, opts)
		local nls = require("null-ls")
		opts.sources = {
			nls.builtins.diagnostics.ruff,
			nls.builtins.diagnostics.shellcheck,
			nls.builtins.diagnostics.rubocop,
			nls.builtins.code_actions.gitsigns,
			-- no formatting sources here!
		}
	end,
}
