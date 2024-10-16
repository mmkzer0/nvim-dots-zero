-- tokyonight theme

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			-- use the storm style
			style = "storm",
			transparent = true,
			terminal_colors = true,
		})
		vim.cmd([[colorscheme tokyonight-storm]])
		vim.cmd([[
      hi Normal guibg=none ctermbg=none
            ]])
	end,
}
