-- File: after/plugin/nvim-tree.lua

-- Setup nvim-tree
require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left", -- Can be "left" or "right"
  },
  renderer = {
    highlight_opened_files = "name", -- Highlight opened files in the tree
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  git = {
    enable = true, -- Show git status in the tree
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
})
