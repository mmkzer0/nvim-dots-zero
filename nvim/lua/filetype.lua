-- nvim/lua/filetype.lua
-- Extensible assembly dialect identification

local dialects = {
  {
    name = "ca65",
    markers = {
      "^%s*%.proc",
      "^%s*%.endproc",
      "^%s*%.segment",
      "^%s*%.export",
      "^%s*%.import",
      "^%s*%.forceimport",
    },
  },
  -- Add more dialects here (arm64, x86, etc.)
}

local function detect_asm_dialect(bufnr)
  -- Default bufnr to current if not provided
  bufnr = bufnr or 0
  
  -- Read first 100 lines for identification markers
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 100, false)
  for _, line in ipairs(lines) do
    for _, dialect in ipairs(dialects) do
      for _, pat in ipairs(dialect.markers) do
        if line:match(pat) then
          return dialect.name
        end
      end
    end
  end
  
  -- Fallback to generic assembly
  return "asm"
end

vim.filetype.add({
  extension = {
    s = function(path, bufnr)
      return detect_asm_dialect(bufnr)
    end,
    asm = function(path, bufnr)
      return detect_asm_dialect(bufnr)
    end,
  },
})
