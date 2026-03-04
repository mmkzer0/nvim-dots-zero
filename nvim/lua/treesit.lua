-- Setup treesitter

local ok, config = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end
-- config.setup(...)
config.setup({
	auto_install = true,
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
