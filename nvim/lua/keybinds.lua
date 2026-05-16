-- keybinds.lua

-- setup keybinds

-- telescope bindings are managed in nvim/lua/plugins/telescope.lua

-- neo-tree bind
vim.keymap.set("n", "<C-t>", ":Neotree filesystem reveal left<CR>", { desc = "NeoTree Reveal" })

-- lsp bindings
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP Go to References" })

-- none-ls bindings
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP Format" })

-- tabby bindings
vim.g.tabby_keybinding_accept = "<C-l>"

-- tabbing keybinds
vim.keymap.set("n", "<leader>n", ":new | only<CR>", { noremap = true, silent = true, desc = "New buffer only" })
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true, desc = "New tab" })
