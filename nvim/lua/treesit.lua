-- Setup treesitter

local config = require("nvim-treesitter.configs")
config.setup({
	auto_install = true,
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
