-- Setup vim-opts
require("vim-opts")

-- Setup filetype detection
require("filetype")

-- init.lua (top)
vim.env.PATH = table.concat({
	vim.fn.stdpath("data") .. "/mason/bin",
	vim.env.PATH or "",
}, ":")

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

-- Include lsp log config
require("lsplog")

-- small diagnostics
require("diagnostics")

-- (optional) CA65 treesitter parser, currently disabled (upstream repo 404)
-- local ok, parsers = pcall(require, "nvim-treesitter.parsers")
-- if ok then
--   -- TODO: add a working ca65 tree-sitter repo here
-- end
