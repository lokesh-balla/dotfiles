return {
	-- show dignostics information
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		cmd = "Trouble",
		config = function()
			require('which-key').add({ "<leader>x", group = "Diagnostics" })
			require('trouble').setup({})
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

	-- neotest for running test case
	{
		"nvim-neotest/neotest",
		event = 'VeryLazy',
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",

			"nvim-neotest/neotest-go",
		},
		config = function()
			require('which-key').add({ "<leader>t", group = "Test", icon = "󱏷" })
			require("neotest").setup({
				icons = {
					passed = "",
					failed = "",
					running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
				},
				adapters = {
					require("neotest-go"),
				},
			})
		end,
		keys = {
			{
				"<leader>tr",
				function() require("neotest").run.run() end,
				desc = "[T]est [R]un"
			},
			{
				"<leader>ts",
				function() require("neotest").run.stop() end,
				desc = "[T]est [S]top"
			},
			{
				"<leader>tf",
				function() require("neotest").run.run(vim.fn.expand("%")) end,
				desc = "[T]est [F]ile"
			},
			{
				"<leader>td",
				function() require("neotest").run.run({ strategy = "dap" }) end,
				desc = "[T]est [D]ebug nearest"
			},
			{
				"<leader>tv",
				function() require("neotest").summary.toggle() end,
				desc = "[T]est [V]iew"
			},
			{
				"<leader>to",
				function() require("neotest").output_panel.toggle() end,
				desc = "[T]est [O]utput panel"
			}
		}
	}
}
