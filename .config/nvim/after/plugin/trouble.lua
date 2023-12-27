-- Lua
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = 'Toggle Diagnostics' })
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = 'Toggle WorkSpace Diagnostics' })
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = 'Toggle Document Diagnostics' })
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = 'Toggle QuickFix' })
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = 'Toggle LocList' })
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = 'Toggle LSP References' })
