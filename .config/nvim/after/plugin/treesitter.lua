require'nvim-treesitter.configs'.setup {
	ensure_installed = { "python", "go", "c", "lua", "vim", "vimdoc", "query" },

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
}
