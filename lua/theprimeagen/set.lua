--Add numbers
vim.opt.nu = true
--Add what type of numbers: relativenumbers 
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false -- real and display lines are the same

vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.o.splitbelow = true
vim.o.cb = 'unnamedplus'
-- vim.o.signcolumn = 'no'
vim.o.modeline = false
vim.o.termguicolors = true
vim.o.background = "dark"

