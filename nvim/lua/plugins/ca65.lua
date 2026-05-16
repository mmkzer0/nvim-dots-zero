-- nvim/lua/plugins/ca65.lua

return {
  "buckynbrocko/tree-sitter-ca65",
  build = function(plugin)
    local parser_dir = require("nvim-treesitter.config").get_install_dir("parser")
    vim.fn.mkdir(parser_dir, "p")
    vim.fn.system(string.format(
      "cc -shared -fPIC -Os -o %s/ca65.so %s/src/parser.c -I%s/src",
      parser_dir, plugin.dir, plugin.dir
    ))
  end,
  config = function()
    -- Map filetype "ca65" to the "ca65" parser; Neovim cannot infer this
    -- automatically for custom filetypes.
    vim.treesitter.language.register("ca65", "ca65")
  end,
}
