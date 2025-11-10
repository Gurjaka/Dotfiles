require("noice").setup({
  lsp = {
    progress = { enabled = true },
    hover = {
      enabled = true,
      silent = true,
      view = nil,
      opts = { border = { style = "rounded" } },
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true,
        luasnip = true,
      },
      opts = { border = { style = "rounded" } },
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true,
  },
})
