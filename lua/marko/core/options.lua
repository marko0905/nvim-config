vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- scrolloff
opt.scrolloff = 15 -- start scrolling when we're 8 lines away from margins

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- Automatically set foldmethod to 'indent' when a file is opened(uncomment to enable)
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   pattern = "*",
--   command = "set foldmethod=indent",
-- })

-- Auto-save the file after 10 seconds of inactivity (changes made)(uncomment to enable)
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--   pattern = "*",
--   callback = function()
--     -- Timer to delay the save by 10 seconds
--     vim.defer_fn(function()
--       -- Only save if the buffer has been modified
--       if vim.bo.modified then
--         vim.cmd("silent! write")
--         print("Auto-saved!")
--       end
--     end, 1000) -- Delay by 1000 ms (10 seconds)
--   end,
-- })

-- Automatically enable spell check when a document is opened
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  command = "set spell",
})
