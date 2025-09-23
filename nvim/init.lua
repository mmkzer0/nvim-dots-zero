-- Setup vim-opts
require("vim-opts")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("plugin")

-- Setup catppucchin
-- require("theme")
-- No longer used since offloading config to plugin file

-- Load keybinds from keybinds.lua
require("keybinds")

-- Setup treesitter
require("treesit")

-- Include lsp log config
require("lsplog")

-- small diagnostics
require("diagnostics")

-- add ca65 ts grammar
local parsers = require("nvim-treesitter.parsers").get_parser_configs()

parsers.ca65 = {
	install_info = {
		url = "https://github.com/babasbot/tree-sitter-ca65",
		files = {
			"src/parser.c",
		},
		branch = "main",
	},
	filetype = "asm",
	maintainers = {
		"@babasbot",
	},
}
