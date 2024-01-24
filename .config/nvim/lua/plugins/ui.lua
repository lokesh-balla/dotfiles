return {

    -- which key for help when a key is pressed
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {}
    },

    -- nvim-tree for file explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require('nvim-tree').setup({
                hijack_cursor = true,
                sync_root_with_cwd = true,
                view = {
                    adaptive_size = false,
                },
                renderer = {
                    full_name = true,
                    group_empty = true,
                    special_files = {},
                    symlink_destination = false,
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                        git_placement = "signcolumn",
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                        },
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_root = true,
                    ignore_list = { "help" },
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                },
                filters = {
                    custom = {
                        "^.git$",
                    },
                },
                actions = {
                    change_dir = {
                        enable = false,
                        restrict_above_cwd = true,
                    },
                    open_file = {
                        resize_window = true,
                        window_picker = {
                            chars = "aoeui",
                        },
                    },
                    remove_file = {
                        close_window = false,
                    },
                },
                log = {
                    enable = false,
                    truncate = true,
                    types = {
                        all = false,
                        config = false,
                        copy_paste = false,
                        diagnostics = false,
                        git = false,
                        profile = false,
                        watcher = false,
                    },
                },
            })

            -- keymaps
            vim.keymap.set('n', '<leader>tt', '<Cmd>NvimTreeToggle<CR>', {
                desc = '[T]oggle [T]ree'
            })
            vim.keymap.set('n', '<leader>tf', '<Cmd>NvimTreeFocus<CR>', {
                desc = '[T]oogle tree [F]ocus'
            })
        end
    },

    -- fidget to show progress
    {
        "j-hui/fidget.nvim",
        opts = {
            integration = {
                ["nvim-tree"] = {
                    enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
                },
            },
        },
    },

    -- treesitter for syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "go", "gomod", "gosum", "gowork",
                    "html",
                    "css", "javascript", "python", "rust", "dart", "bash", "dockerfile", "markdown",
                    "markdown_inline", "regex" },
                sync_install = false,
                auto_install = false,
                ignore_install = {},
                highlight = {
                    enable = true,
                    use_languagetree = true
                },

                indent = {
                    enable = true
                }
            })
        end
    },

    -- trouble for diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            -- Lua
            vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = 'Toggle Diagnostics' })
            vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
                { desc = 'Toggle WorkSpace Diagnostics' })
            vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
                { desc = 'Toggle Document Diagnostics' })
            vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end,
                { desc = 'Toggle QuickFix' })
            vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end,
                { desc = 'Toggle LocList' })
            vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end,
                { desc = 'Toggle LSP References' })
        end
    },

    -- indentscope for highlighting selected scope
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = { enabled = false },
        },
    },
}
