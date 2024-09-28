return {
	-- show dignostics information
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	-- TODO highlighting
	{
		'folke/todo-comments.nvim',
		event = 'VeryLazy',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {}
	},

	-- Detect tabstop and shiftwidth automatically
	{ 'tpope/vim-sleuth',            event = 'VimEnter' },

	-- show vcs diff
	{
		'echasnovski/mini.diff',
		version = '*',
		event = 'VeryLazy',
		opts = {
			view = {
				style = 'sign',
				signs = { add = '+', change = '~', delete = '-' },
			},
		},
	},

	-- split and join lines
	{ 'echasnovski/mini.splitjoin',  version = '*',     event = 'VeryLazy', opts = {} },

	-- highlight cursor word
	{ 'echasnovski/mini.cursorword', version = '*',     event = 'VeryLazy', opts = { delay = 500 } },

	-- generate bracket pairs
	{ 'echasnovski/mini.pairs',      version = '*',     event = 'VeryLazy' },
}
