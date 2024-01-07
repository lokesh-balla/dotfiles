require('notify').setup({
  render = "default",
  timeout = 3000,
})

require('noice').setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
  },
})

