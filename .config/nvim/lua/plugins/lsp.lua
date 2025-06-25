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
					rangeVariableTypes = true
				},
				staticcheck = true,
				gofumpt = true,
			},
		},
	},
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"saghen/blink.cmp",
			{ "folke/lazydev.nvim", ft = "lua", opts = {} }
		},
		config = function()
			-- Configure Mason for installing LSP servers (optional but recommended)
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- Get capabilities from blink.cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, {
						buffer = bufnr,
						desc = desc,
					})
				end

				require("which-key").add({ "<leader>c", group = "Code" })
				nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode LSP [R]ename")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				require("which-key").add({ "g", group = "Goto" })
				nmap("gd", require("snacks.picker").lsp_definitions, "[G]oto [D]efinition")
				nmap("gr", require("snacks.picker").lsp_references, "[G]oto [R]eferences")
				nmap("gI", require("snacks.picker").lsp_implementations, "[G]oto [I]mplementation")
				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				require("which-key").add({ "<leader>f", group = "Format" })
				nmap("<leader>ff", vim.lsp.buf.format, "[F]ormat [F]ile")

				nmap("<leader>sD", require("snacks.picker").lsp_type_definitions, "[S]earch Type [D]efinition")

				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
			end

			-- Configure LSP servers using vim.lsp.config (Neovim 0.11+)
			for server_name, config in pairs(servers) do
				vim.lsp.config[server_name] = vim.tbl_extend("force", {
					capabilities = capabilities,
					on_attach = on_attach,
				}, config)
			end

			-- Enable the configured LSP servers
			for server_name, _ in pairs(servers) do
				vim.lsp.enable(server_name)
			end
		end,
	},
}
