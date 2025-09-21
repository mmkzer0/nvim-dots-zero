-- lua/config/diagnostics.lua

vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = "●" },
	update_in_insert = false,
	severity_sort = true,
})
