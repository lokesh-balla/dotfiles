return {
	-- suggestions of <leader> key presses
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
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
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"dart",
					"dockerfile",
					"go",
					"gomod",
					"gosum",
					"gowork",
					"html",
					"javascript",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"rust",
					"vim",
					"vimdoc",
				},
				sync_install = false,
				auto_install = false,
				ignore_install = {},
				highlight = {
					enable = true,
					use_languagetree = true
				},
				indent = {
					enable = true
				}
			})

			-- setting folding
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			vim.opt.foldenable = false
		end
	},
}
