local augroup = vim.api.nvim_create_augroup('UserConfig', { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "c", "cpp", "python" },
	command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab"
})
