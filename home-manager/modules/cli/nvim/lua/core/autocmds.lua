local augroup = vim.api.nvim_create_augroup('UserConfig', { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "c", "cpp", "python", "zig" },
  callback = function()
    local opt = vim.opt_local
      opt.tabstop = 4
      opt.shiftwidth = 4
      opt.expandtab = true
  end,
})
