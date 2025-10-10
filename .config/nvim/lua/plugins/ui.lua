return {
	-- suggestions of <leader> key presses
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	-- fidget to show progress
	{ "j-hui/fidget.nvim", opts = { notification = { window = { winblend = 0 } } } },

	-- treesitter for syntax highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		branch = 'main',
		build = ':TSUpdate',
		init = function()
			require('nvim-treesitter').install({
				"go",
				"gomod",
				"gosum",
				"gotmpl",
				"dockerfile",
				"html",
				"css",
				"javascript",
				"typescript",
				"yaml",
				"json",
				"toml",
				"proto",
				"sql",
				"rust",
				"python",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline"
			}):wait(300000) -- to prevent async execution waiting max. 5 minutes

			vim.api.nvim_create_autocmd('FileType', {
				callback = function() 
					-- highlights
					local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser

					-- indent
					if hasStarted then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
					end
				end,
			})
		end
	},

	-- markdown render
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
		event = "VeryLazy",
		opts = {
			completions = { blink = { enabled = true } },
		},
	},
}
