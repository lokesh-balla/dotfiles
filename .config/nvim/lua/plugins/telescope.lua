return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-symbols.nvim',
            {
                -- only try compilation if make is available in system
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end
            },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_config = {
                        horizontal = { prompt_position = "bottom", preview_width = 0.65 },
                        vertical = { mirror = false },
                        width = 0.90,
                        height = 0.95,
                        preview_cutoff = 120,
                    },
                    path_display = { "truncate" },
                },
                pickers = {
                    find_files = {
                        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                    },
                    live_grep = {
                        additional_args = function()
                            return { "--hidden", "--glob", "!**/.git/*" }
                        end
                    },
                    grep_string = {
                        additional_args = function()
                            return { "--hidden", "--glob", "!**/.git/*" }
                        end
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case"
                    }
                }
            })

            pcall(require('telescope').load_extension, 'fzf')

            -- keybinds
            vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, {
                desc = '[?] Find recently opened files'
            })
            vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, {
                desc = '[ ] Find existing buffers'
            })
            vim.keymap.set('n', '<leader>/', function()
                require('telescope.builtin').current_buffer_fuzzy_find(
                    require('telescope.themes').get_dropdown {
                        previewer = false
                    })
            end, {
                desc = '[/] Fuzzily search in current buffer'
            })

            local function telescope_live_grep_open_files()
                require('telescope.builtin').live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files'
                }
            end
            vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, {
                desc = '[S]earch [/] in Open Files'
            })
            vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, {
                desc = '[S]earch [S]elect Telescope'
            })
            vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, {
                desc = 'Search [G]it [F]iles'
            })
            vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, {
                desc = '[S]earch [F]iles'
            })
            vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, {
                desc = '[S]earch [H]elp'
            })
            vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, {
                desc = '[S]earch current [W]ord'
            })
            vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, {
                desc = '[S]earch by [G]rep'
            })
            vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, {
                desc = '[S]earch [D]iagnostics'
            })
            vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, {
                desc = '[S]earch [R]esume'
            })
        end
    },
}
