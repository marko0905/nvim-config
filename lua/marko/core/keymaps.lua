vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "clear search highlights" })

-- increment/decrement numbers (uncomment to enable)
--[[ keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement ]]

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

--[[ keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab ]]

-- terminal
keymap.set("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal") -- Open terminal in a vertical split
  vim.api.nvim_command("startinsert") -- Automatically enter insert mode
end, { desc = "Open terminal verticaly" }) -- open terminal
keymap.set("n", "<leader>th", function()
  vim.cmd("split | terminal") -- Open terminal in a horizontal split
  vim.api.nvim_command("startinsert") -- Automatically enter insert mode
end, { desc = "Open terminal horizontaly" }) -- open terminal

-- split movement
keymap.set("n", "<C-M-h>", "<C-w>h", { desc = "Move to left buffer" }) -- move to left split
keymap.set("n", "<C-M-left>", "<C-w>h", { desc = "Move to left buffer" }) -- move to left split with arrow key
keymap.set("n", "<C-M-l>", "<C-w>l", { desc = "Move to right buffer" }) -- move to right split
keymap.set("n", "<C-M-right>", "<C-w>l", { desc = "Move to right buffer" }) -- move to right split with arrow key
keymap.set("n", "<C-M-k>", "<C-w>k", { desc = "Move to up buffer" }) -- move to up split
keymap.set("n", "<C-M-up>", "<C-w>k", { desc = "Move to up buffer" }) -- move to up split with arrow key
keymap.set("n", "<C-M-j>", "<C-w>j", { desc = "Move to down buffer" }) -- move to down split
keymap.set("n", "<C-M-down>", "<C-w>j", { desc = "Move to down buffer" }) -- move to down split with arrow key

-- vertical movement
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down and center" }) -- move down and center
keymap.set("n", "<C-u>", "<C-u>zz", { desc = ";ove up and center" }) -- move up and center

-- line movement
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" }) -- move selected lines down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" }) -- move selected lines up

-- indent movement
keymap.set("n", "<<", "V>", { desc = "Indent line left" }) -- indent line left
keymap.set("n", ">>", "V<", { desc = "Indent line right" }) -- indent line right

-- undo-tree show / hide
keymap.set("n", "<leader>us", "<cmd>UndotreeShow<CR>", { desc = "Show Undo-Tree" }) -- open undo-tree
keymap.set("n", "<leader>uh", "<cmd>UndotreeHide<CR>", { desc = "Hide Undo-Tree" }) -- close undo-tree

-- search and replace word under cursor
vim.keymap.set(
  "n",
  "<leader>ra",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Search and replace all the word that are like the one under cursor" }
)
vim.keymap.set("n", "<leader>re", [[:normal! ciw]], { desc = "Replace word under cursor" })

-- codeium asistant
keymap.set("n", "<leader>cc", "<cmd>Codeium Chat<CR>", { desc = "Codeium Assistant" }) -- open codeium assistant
