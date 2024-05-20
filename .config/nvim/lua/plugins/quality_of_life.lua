return {
	-- comments
	{ 'echasnovski/mini.comment', event = 'VimEnter', version = '*',                              opts = {} },
	-- auto pairs
	{ 'echasnovski/mini.pairs',   event = 'VimEnter', version = '*',                              opts = {} },
	-- Detect tabstop and shiftwidth automatically
	{ 'tpope/vim-sleuth',         event = 'VimEnter' },
	-- Highlight todo, notes, etc in comments
	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },
}
