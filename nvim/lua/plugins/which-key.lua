-- nvim/lua/plugins/which-key.lua
-- which-key v3 setup

return {
	"folke/which-key.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {
		-- Defaults are sufficient; which-key v3 handles discovery automatically.
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "LSP" },
			{ "<leader>t", group = "Tabs" },
			{ "<leader>d", group = "DAP" },
		})
	end,
}
