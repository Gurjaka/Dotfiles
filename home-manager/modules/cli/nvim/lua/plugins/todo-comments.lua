require("todo-comments").setup({
  signs = true, -- show icons in sign column
  sign_priority = 8,
  highlight = {
    multiline = false,
    before = "", -- don't show extra markers before text
    keyword = "wide", -- highlight the whole keyword (TODO, FIX, etc.)
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*:]], -- match `TODO:` `FIXME:` etc.
    comments_only = true,
  },
  keywords = {
    FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT" } },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
    PERF = { icon = " ", color = "hint", alt = { "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#BF616A" },
    warning = { "DiagnosticWarn", "WarningMsg", "#EBCB8B" },
    info = { "DiagnosticInfo", "#81A1C1" },
    hint = { "DiagnosticHint", "#88C0D0" },
    default = { "Identifier", "#4C566A" },
  },
  gui_style = {
    fg = "BOLD",
    bg = "NONE",
  },
})
