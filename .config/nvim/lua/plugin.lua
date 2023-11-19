vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- catppuccin theme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- telescope fuzzy find
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-symbols.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
	},

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- git signs
	{ "lewis6991/gitsigns.nvim" },

	-- lsp-zero for lsp and code completion
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

	-- code suggestions for nvim lua config
	{ "folke/neodev.nvim" },

})
