require("illuminate").configure({
  providers = {
    "lsp", "treesitter", "regex",
  },
  delay = 120,                 -- how long before highlighting (ms)
  filetypes_denylist = {
    "NvimTree",
    "alpha",
    "lazy",
    "mason",
    "toggleterm",
    "qf",
    "help",
  },
  under_cursor = true,         -- highlight word under cursor
  large_file_cutoff = 2000,    -- disable on large files (>2000 lines)
  min_count_to_highlight = 2,  -- only highlight if word appears at least twice
})
