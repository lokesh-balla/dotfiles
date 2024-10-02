return {
	-- show dignostics information
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		opts = {},
		cmd = "Trouble",
		config = function()
			require('which-key').add({ "<leader>x", group = "Diagnostics" })
		end,
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

	-- split and join lines
	{ 'echasnovski/mini.splitjoin',  version = '*',     event = 'VeryLazy', opts = {} },

	-- highlight cursor word
	{ 'echasnovski/mini.cursorword', version = '*',     event = 'VeryLazy', opts = { delay = 500 } },

	-- generate bracket pairs
	{ 'echasnovski/mini.pairs',      version = '*',     event = 'VeryLazy', opts = {} },
}
