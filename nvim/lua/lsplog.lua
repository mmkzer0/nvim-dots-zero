-- lsp logging config and truncation

vim.lsp.log.set_level("ERROR")
vim.api.nvim_create_user_command("LspLogTrim", function()
	local p = vim.lsp.get_log_path()
	local f = io.open(p, "w")
	if f then
		f:write("")
		f:close()
	end
	vim.notify("LSP log truncated: " .. p)
end, {})
