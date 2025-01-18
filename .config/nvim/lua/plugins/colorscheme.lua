return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				on_colors = function(c)
					c.border = c.blue0
				end,
			})

			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
