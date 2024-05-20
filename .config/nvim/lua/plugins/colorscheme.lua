return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				color_overrides = {
					all = {
						text = "#ffffff",
					},
					frappe = {},
					macchiato = {},
					mocha = {
						base = "#000000",
						mantle = "#010101",
						crust = "#020202",
					},
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					telescope = {
						enabled = true,
					},
					lsp_trouble = true,
					which_key = true,
					dap = true,
					dap_ui = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
					},
				},
			})

			-- setup must be called before loading
			vim.cmd.colorscheme "catppuccin"
		end,
	},
}
