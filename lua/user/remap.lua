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

-- Navigate to the previous buffer or NvimTree
vim.keymap.set('n', '<C-h>', function()
  local tree_win = get_tree_win() -- Check if NvimTree is open
  local current_buf = vim.api.nvim_get_current_buf() -- Get the current buffer ID
  local buffers = vim.fn.getbufinfo({ buflisted = true }) -- Get all listed buffers

  if tree_win and vim.api.nvim_get_current_win() == tree_win then
    vim.api.nvim_set_current_buf(buffers[#buffers].bufnr) -- Go to the last buffer
  else
    local prev_buf = nil
    for i, buf in ipairs(buffers) do
      if buf.bufnr == current_buf then
        prev_buf = buffers[i - 1] and buffers[i - 1].bufnr or nil
        break
      end
    end
    if prev_buf then
      vim.api.nvim_set_current_buf(prev_buf) -- Switch to the previous buffer
    elseif tree_win then
      vim.api.nvim_set_current_win(tree_win) -- Switch to the NvimTree
    end
  end
end, { desc = "Previous buffer or NvimTree" })

-- Navigate to the next buffer or NvimTree
vim.keymap.set('n', '<C-l>', function()
  local tree_win = get_tree_win() -- Check if NvimTree is open
  local current_buf = vim.api.nvim_get_current_buf() -- Get the current buffer ID
  local buffers = vim.fn.getbufinfo({ buflisted = true }) -- Get all listed buffers

  if tree_win and vim.api.nvim_get_current_win() == tree_win then
    vim.api.nvim_set_current_buf(buffers[1].bufnr) -- Go to the first buffer
  else
    local next_buf = nil
    for i, buf in ipairs(buffers) do
      if buf.bufnr == current_buf then
        next_buf = buffers[i + 1] and buffers[i + 1].bufnr or nil
        break
      end
    end
    if next_buf then
      vim.api.nvim_set_current_buf(next_buf) -- Switch to the next buffer
    elseif tree_win then
      vim.api.nvim_set_current_win(tree_win) -- Switch to the NvimTree
    end
  end
end, { desc = "Next buffer or NvimTree" })

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