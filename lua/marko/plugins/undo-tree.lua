return {
  "mbbill/undotree",
  lazy = false,

  keys = {
    { "n", "<leader>u", ":UndotreeShow<CR>", { desc = "Toggle the undotree" } },
  },

  config = function()
    -- Set focus on UndoTree window when toggled
    vim.g.undotree_SetFocusWhenToggle = 1

    -- Set the width of the UndoTree split window
    vim.g.undotree_SplitWidth = 30
    vim.g.undotree_SplitMinWidth = 30
  end,
}
