-- File: after/plugin/bufferline.lua
require("bufferline").setup {
  options = {
    numbers = "none", -- "none", "ordinal", "buffer_id", "both"
    close_command = "bdelete! %d", -- Command to close a buffer
    right_mouse_command = "bdelete! %d", -- Right-click close
    left_mouse_command = "buffer %d", -- Left-click to switch buffers
    middle_mouse_command = nil, -- Middle-click does nothing
    indicator = { style = "underline" }, -- Underline active buffer
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15, -- Prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "center" },
    },
    show_buffer_icons = true, -- Enable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    persist_buffer_sort = true, -- Keep buffer sorting across sessions
    separator_style = "thin", -- "slant" | "thick" | "thin"
  }
}
