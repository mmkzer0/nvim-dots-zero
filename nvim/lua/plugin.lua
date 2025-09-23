-- plugin.lua
-- setting up lazy.nvim

local lazy = require("lazy")

lazy.setup({
	spec = "plugins", -- getting plugin specs from /lua/plugins
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
	rocks = { enabled = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
				"matchit",
				"matchparen",
				"netrwPlugin",
			},
		},
	},
})
