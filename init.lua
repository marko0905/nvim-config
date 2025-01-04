-- File: after/plugin/line_numbers.lua

require("user.remap")

-- Enable line numbers
vim.o.number = true -- Absolute line numbers

-- Enable relative line numbers
vim.o.relativenumber = true -- Relative to the cursor position

-- Additional options
vim.o.numberwidth = 4 -- Width of the line number column

-- Highlight the current line
vim.o.cursorline = true -- Highlight the entire current line
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFD700", bold = true }) -- Highlight current line number

-- General tab settings
vim.o.expandtab = true     -- Use spaces instead of tabs
vim.o.shiftwidth = 4       -- Number of spaces for indentation
vim.o.tabstop = 4          -- Number of spaces for a tab
vim.o.softtabstop = 4      -- Number of spaces for a <Tab> in insert mode
vim.o.smartindent = true   -- Enable smart indentation
vim.o.autoindent = true    -- Enable auto indentation

-- Scroll offset settings
vim.o.scrolloff = 20

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
