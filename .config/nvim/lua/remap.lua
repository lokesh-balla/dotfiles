-- setting leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- setting default tab spaces
vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 4

-- setting netrw settings
vim.g.netrw_winsize = 20
vim.g.netrw_liststyle = 3
vim.keymap.set('n', '<C-n>', ':Lex<cr>', {})


