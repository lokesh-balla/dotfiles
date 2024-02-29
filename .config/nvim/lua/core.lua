-- Set Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Make line numbers default
vim.wo.relativenumber = true
vim.wo.number = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Sets how neovim will display certain whitespace in the editor.
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Decrease update time to update swap file on disk
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Enables 24-bit RGB colors (should be supported by terminal as well)
vim.o.termguicolors = true

-- tabstop and shiftwidth
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- custom keybinding for vim defaults
vim.keymap.set({ 'n', 'i', 'v', 'x' }, '<S-Tab>', '<Esc>', {
  desc = 'Escape'
})
