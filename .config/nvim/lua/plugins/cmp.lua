return {
	-- blink.cmp for completions
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			keymap = { preset = "super-tab" },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			completion = {
				ghost_text = {
					enabled = true,
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer", "markdown" },
				providers = {
					markdown = {
						name = "RenderMarkdown",
						module = "render-markdown.integ.blink",
						fallbacks = { "lsp" },
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
