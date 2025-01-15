-- File: nvim/lua/user/remap.lua

vim.g.mapleader = " " -- Set the leader key to space

-- Function to get NvimTree window ID
local function get_tree_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
    if bufname:match("NvimTree_") then
      return win
    end
  end
  return nil
end

-- Simple buffer navigation
vim.keymap.set('n', '<C-h>', ':bprevious<CR>', { silent = true, desc = "Previous buffer" })
vim.keymap.set('n', '<C-l>', ':bnext<CR>', { silent = true, desc = "Next buffer" })

-- Vertical window navigation
vim.keymap.set('n', '<C-j>', function()
  -- Try to move to the window below
  local win_below = vim.fn.winnr('j')
  if win_below ~= vim.fn.winnr() then
    vim.cmd('wincmd j')
  end
end, { desc = "Move to window below" })

vim.keymap.set('n', '<C-k>', function()
  -- Try to move to the window above
  local win_above = vim.fn.winnr('k')
  if win_above ~= vim.fn.winnr() then
    vim.cmd('wincmd k')
  end
end, { desc = "Move to window above" })

-- Window splitting with new local buffers
vim.keymap.set('n', '<leader>sh', function()
    vim.cmd('split')              -- Create horizontal split
    local buf = vim.api.nvim_create_buf(true, true)  -- Create new buffer (listed, scratch)
    vim.api.nvim_win_set_buf(0, buf)  -- Set new buffer in the new window
end, { desc = "Split window horizontally with new buffer", silent = true })

vim.keymap.set('n', '<leader>sv', function()
    vim.cmd('vsplit')             -- Create vertical split
    local buf = vim.api.nvim_create_buf(true, true)  -- Create new buffer (listed, scratch)
    vim.api.nvim_win_set_buf(0, buf)  -- Set new buffer in the new window
end, { desc = "Split window vertically with new buffer", silent = true })

-- Close active window
vim.keymap.set('n', '<leader>sc', '<C-w>c',
  { desc = "Close active window", silent = true })