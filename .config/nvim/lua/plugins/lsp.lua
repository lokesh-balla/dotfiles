-- LSP Server configurations
--      The configuration is in format
--      <mason_server_name> = {
--          <all_the_lsp_configuration>
--      }
local servers = {
	lua_ls = {
		Lua = {
			workspace = {
				checkThirdParty = false
			},
			telemetry = {
				enable = false
			}
		}
	},
	gopls = {
		gopls = {
			analyses = {
				unusedparams = true
			},
			staticcheck = true,
			gofumpt = true
		}
	}
}

local lsp_servers_to_install = {}
for server_name, _ in pairs(servers) do
	table.insert(lsp_servers_to_install, server_name)
end

return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'folke/neodev.nvim',
		},
		config = function()
			-- Configure Mason First
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})

			-- Setup neovim lua configuration
			require('neodev').setup()

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = 'LSP: ' .. desc
					end

					vim.keymap.set('n', keys, func, {
						buffer = bufnr,
						desc = desc
					})
				end

				require('which-key').add({ "<leader>c", group = "Code" })
				nmap('<leader>cr', vim.lsp.buf.rename, '[L]SP [R]ename')
				nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

				require('which-key').add({ "g", group = "Goto" })
				nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
				nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
				nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
				nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

				require('which-key').add({ "<leader>f", group = "Format" })
				nmap('<leader>ff', vim.lsp.buf.format, '[F]ormat [F]ile')

				nmap('<leader>sD', require('telescope.builtin').lsp_type_definitions, '[S]earch Type [D]efinition')

				nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
				nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

				vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
					vim.lsp.buf.format()
				end, {
					desc = 'Format current buffer with LSP'
				})
			end

			require('mason-lspconfig').setup({
				ensure_installed = lsp_servers_to_install,
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup {
							capabilities = capabilities,
							on_attach = on_attach,
							settings = servers[server_name],
							filetypes = (servers[server_name] or {}).filetypes
						}
					end
				}
			})
		end
	},
}
