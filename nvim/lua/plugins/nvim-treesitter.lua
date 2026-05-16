-- treesitter plugin

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.config")
    config.setup()

    -- Monkeypatch for Telescope compatibility (ft_to_lang, get_parser, and configs removed in main)
    local ts_parsers = require("nvim-treesitter.parsers")
    if not ts_parsers.ft_to_lang then
      ts_parsers.ft_to_lang = function(ft)
        return vim.treesitter.language.get_lang(ft) or ft
      end
    end
    if not ts_parsers.get_parser then
      ts_parsers.get_parser = function(bufnr, lang)
        return vim.treesitter.get_parser(bufnr, lang)
      end
    end

    if not package.loaded["nvim-treesitter.configs"] then
      package.loaded["nvim-treesitter.configs"] = {
        is_enabled = function(module, lang, bufnr)
          if module == "highlight" then
            local ok, parser = pcall(vim.treesitter.get_parser, bufnr, lang)
            return ok and parser ~= nil
          end
          return false
        end,
        get_module = function(_module) return {} end,
        setup = function() end,
        reattach_module = function() end,
        detach_module = function() end,
      }
    end

    -- Add queries to runtimepath (main branch moves them)
    local install_queries = config.get_install_dir("queries")
    vim.opt.runtimepath:append(install_queries)

    -- Enable highlighting; use pcall to gracefully handle parsers that
    -- fail to load (e.g., not installed or unsupported on this platform).
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang or lang == "" then return end
        local ok, has_parser = pcall(vim.treesitter.language.add, lang)
        if ok and has_parser then
          vim.treesitter.start(args.buf, lang)
        end
      end,
    })
  end,
}
