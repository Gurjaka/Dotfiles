-- General
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.list = true
vim.o.listchars = "tab:→ ,trail:·,extends:↷,precedes:↶"

-- Editor
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.softtabstop = -1
vim.o.clipboard = "unnamedplus"
vim.o.swapfile = false
vim.o.autoread = true
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undo"

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- Performance
if vim.loader and vim.loader.enable then vim.loader.enable() end
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.ttyfast = true

-- UI Polish
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.cursorline = true
