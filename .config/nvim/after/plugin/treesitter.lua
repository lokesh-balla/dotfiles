require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "go", "gomod", "gosum", "gowork", "html", "css", "javascript", "python", "rust", "dart", "bash", "dockerfile" },

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
}
