require("which-key").setup({
  preset = "helix",  -- smoother visuals & layout
  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,

  win = {
    border = "rounded",
    no_overlap = true,
    padding = { 2, 4 },
    title = true,
    title_pos = "center",
    zindex = 1000,
    wo = {
      winblend = 10, -- transparent popup
    },
  },

  layout = {
    width = { min = 25, max = 60 },
    spacing = 6,
    align = "left",
  },

  icons = {
    breadcrumb = "»",
    separator = "",
    group = "+",
    ellipsis = "…",
    mappings = true,
    colors = true,
  },

  plugins = {
    marks = true,
    registers = true,
    spelling = { enabled = false },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },

  sort = { "local", "order", "group", "alphanum", "mod" },
  notify = false,
  show_help = false,
  show_keys = true,
})
