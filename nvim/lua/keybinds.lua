-- keybinds.lua

-- setup keybinds

-- telescope bindings

vim.keymap.set("n", "<C-f>", function() require("telescope.builtin").find_files() end, {})
vim.keymap.set("n", "<C-g>", function() require("telescope.builtin").live_grep() end, {})
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, {})
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, {})
vim.keymap.set("n", "<leader>of", function() require("telescope.builtin").oldfiles() end, { silent = true })

-- neo-tree bind
vim.keymap.set("n", "<C-t>", ":Neotree filesystem reveal left<CR>", {})

-- lsp bindings
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})

-- none-ls bindings
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- tabby bindings
vim.g.tabby_keybinding_accept = "<C-l>"

-- tabbing keybinds
vim.api.nvim_set_keymap("n", "<leader>n", ":new | only<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true })
