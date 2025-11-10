require("bufferline").setup({
  options = {
    mode = "buffers",
    numbers = "none",
    indicator = {
      icon = "▎",
      style = "icon",
    },
    modified_icon = "●",
    close_icon = "",
    buffer_close_icon = "󰅖",
    left_trunc_marker = "",
    right_trunc_marker = "",

    diagnostics = "nvim_lsp",    -- show LSP diagnostics in bufferline
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,

    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },

    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    separator_style = "thin",
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 150,
      reveal = { "close" },
    },

    sort_by = "insert_after_current",
  },
})
