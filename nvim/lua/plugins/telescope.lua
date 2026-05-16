-- telescope plugin

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    cmd = "Telescope",
    keys = {
      { "<C-f>", function() require("telescope.builtin").find_files() end, desc = "Telescope Find Files" },
      { "<C-g>", function() require("telescope.builtin").live_grep() end, desc = "Telescope Live Grep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope Help Tags" },
      { "<leader>of", function() require("telescope.builtin").oldfiles() end, desc = "Telescope Old Files" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
