local augroup = vim.api.nvim_create_augroup('UserConfig', { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "c", "cpp", "python" },
  callback = function(args)
    local opt = vim.opt_local
    if args.match == "python" then
      opt.tabstop = 4
      opt.shiftwidth = 4
      opt.expandtab = true
    else
      opt.tabstop = 4
      opt.shiftwidth = 4
      opt.expandtab = false
    end
  end,
})
