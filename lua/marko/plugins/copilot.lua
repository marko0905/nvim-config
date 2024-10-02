-- return {
--   "github/copilot.vim",
--   lazy = false,
--   config = function()
--     -- Mapping tab is already used by NvChad
--     vim.g.copilot_no_tab_map = true -- Disable default Copilot tab mapping
--     vim.g.copilot_assume_mapped = true -- Assume the key mappings are set manually
--     vim.g.copilot_tab_fallback = "" -- No fallback action for the Tab key
--     -- The mapping is set to other key, see custom/lua/mappings
--     -- or run <leader>ch to see copilot mapping section
--   end,
-- }

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
