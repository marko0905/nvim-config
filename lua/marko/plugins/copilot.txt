return {
  {
    "github/copilot.vim",
    lazy = false, -- Ensure Copilot is loaded immediately, not lazy-loaded
    config = function()
      -- Disable default Copilot Tab mapping
      vim.g.copilot_no_tab_map = true

      -- Custom mapping for Tab: Accept Copilot suggestion if available, otherwise behave normally
      vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<Tab>")', { expr = true, silent = true })

      -- Custom mapping for Shift-Tab: Use for navigating previous suggestions or fallback to regular Shift-Tab behavior
      vim.api.nvim_set_keymap(
        "i",
        "<S-Tab>",
        'pumvisible() ? "<C-p>" : copilot#Previous()',
        { expr = true, silent = true }
      )
    end,
  },
}
