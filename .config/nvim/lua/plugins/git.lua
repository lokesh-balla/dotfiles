return {
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs                        = {
				add          = { text = '┃' },
				change       = { text = '┃' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			signs_staged                 = {
				add          = { text = '┃' },
				change       = { text = '┃' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			signs_staged_enable          = true,
			signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir                 = {
				follow_files = true
			},
			auto_attach                  = true,
			attach_to_untracked          = false,
			current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts      = {
				virt_text = true,
				virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
			sign_priority                = 6,
			update_debounce              = 100,
			status_formatter             = nil, -- Use default
			max_file_length              = 40000, -- Disable if file is longer than this (in lines)
			preview_config               = {
				-- Options passed to nvim_open_win
				border = 'single',
				style = 'minimal',
				relative = 'cursor',
				row = 0,
				col = 1
			},
			on_attach                    = function(bufnr)
				local gitsigns = require('gitsigns')

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				require('which-key').add({ "<leader>g", group = "Git" })

				-- Actions
				map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[G]it Hunk [S]tage' })
				map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[G]it Hunk [R]eset' })
				map('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
					{ desc = '[G]it Hunk [S]tage' })
				map('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
					{ desc = '[G]it Hunk [R]eset' })
				map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[G]it Hunk Stage [U]ndo' })
				map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[G]it Hunk [P]review' })
				map('n', '<leader>gb', function() gitsigns.blame_line { full = true } end,
					{ desc = '[G]it Hunk [B]lame' })
				map('n', '<leader>gd', gitsigns.diffthis, { desc = '[G]it Hunk [D]iff' })
			end
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true
	},
}
