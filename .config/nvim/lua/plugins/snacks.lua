return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		picker = {
			enabled = true,
			layout = "ivy",
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		-- Top Pickers & Explorer
		{ "<leader><space>", function() Snacks.picker.smart() end,                                             desc = "Smart Find Files" },
		{ "<leader>/",       function() Snacks.picker.grep() end,                                              desc = "Grep" },
		{ "<leader>:",       function() Snacks.picker.command_history() end,                                   desc = "Command History" },
		{ "<leader>n",       function() Snacks.picker.notifications() end,                                     desc = "Notification History" },
		{ "<leader>e",       function() Snacks.explorer() end,                                                 desc = "File Explorer" },
		-- find
		{ "<leader>sb",      function() Snacks.picker.buffers() end,                                           desc = "[S]earch [B]uffers" },
		{ "<leader>sf",      function() Snacks.picker.files({ cmd = "rg", hidden = true, follow = true }) end, desc = "[S]earch [F]iles" },
		{ "<leader>sg",      function() Snacks.picker.grep() end,                                              desc = "Grep" },
		-- LSP
		{ "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                                       desc = "LSP Symbols" },
		{ "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                             desc = "LSP Workspace Symbols" },
		{ "<leader>un",      function() Snacks.notifier.hide() end,                                            desc = "Dismiss All Notifications" },
	},
}
