require("noice").setup({
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    opts = {
      title = "Command",
      title_pos = "center",
    },
    format = {
      cmdline = {
        pattern = "^:",
        icon = "",
        lang = "vim",
        kind = "command",
        view = "cmdline_popup",
      },
      search_down = {
        kind = "search",
        pattern = "^/",
        icon = " ",
        lang = "regex",
        view = "cmdline_popup",
      },
      search_up = {
        kind = "search",
        pattern = "^%?",
        icon = " ",
        lang = "regex",
        view = "cmdline_popup",
      },
    },
  },
  views = {
    cmdline_popup = {
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      position = {
        row = "50%",
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
      win_options = {
        winhighlight = { 
          Normal = "Normal",
          FloatBorder = "DiagnosticInfo",
        },
      },
      title = {
        border = "rounded",
        position = "center",
        size = 12,
      },
    },
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  messages = {
    enabled = true,
    view = "notify",
    view_error = "notify",
    view_warn = "notify",
    view_history = "messages",
    view_search = false,
  },
})