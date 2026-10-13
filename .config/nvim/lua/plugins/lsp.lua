local servers = {
	lua_ls = {
		settings = {
			Lua = {
				workspace = {
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	gopls = {
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
				staticcheck = true,
				gofumpt = true,
			},
		},
	},
}

return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"folke/which-key.nvim",
			{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			require("which-key").add({
				{ "<leader>c", group = "Code" },
				{ "g",         group = "Goto" },
				{ "<leader>f", group = "Format" },
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
				callback = function(ev)
					local nmap = function(keys, func, desc)
						vim.keymap.set("n", keys, func, {
							buf = ev.buf,
							desc = "LSP: " .. desc,
						})
					end

					nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode LSP [R]ename")
					nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					nmap("gd", require("snacks.picker").lsp_definitions, "[G]oto [D]efinition")
					nmap("gr", require("snacks.picker").lsp_references, "[G]oto [R]eferences")
					nmap("gI", require("snacks.picker").lsp_implementations, "[G]oto [I]mplementation")
					nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					nmap("<leader>ff", vim.lsp.buf.format, "[F]ormat [F]ile")
					nmap("<leader>sD", require("snacks.picker").lsp_type_definitions, "[S]earch Type [D]efinition")
					nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
				end,
			})

			-- Merge with nvim-lspconfig defaults (cmd, filetypes, root markers)
			vim.lsp.config("*", { capabilities = capabilities })
			for server_name, config in pairs(servers) do
				vim.lsp.config(server_name, config)
			end
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = vim.tbl_keys(servers),
			automatic_enable = true,
		},
	},
}
