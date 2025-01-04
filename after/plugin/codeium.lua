-- -- File: after/plugin/codeium.lua

-- require('codeium').setup({
--   config = {
--     tools = {
--       language_server = {
--         cmd = "codeium",
--       },
--     },
--   },
-- })

-- -- Add Codeium to nvim-cmp sources
-- local cmp = require('cmp')
-- local config = cmp.get_config()
-- table.insert(config.sources, {
--   name = 'codeium',
--   priority = 1000,  -- High priority to show Codeium suggestions first
-- })
-- cmp.setup(config)

-- -- Keybindings
-- vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
-- vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
-- vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
-- vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

-- -- Status in lualine (if you use it)
-- local function codeium_status()
--   return vim.fn['codeium#GetStatusString']()
-- end

-- -- Add to lualine if you're using it
-- local has_lualine, lualine = pcall(require, 'lualine')
-- if has_lualine then
--   lualine.setup {
--     sections = {
--       lualine_x = {
--         codeium_status,
--         'encoding',
--         'fileformat',
--         'filetype'
--       }
--     }
--   }
-- end

-- File: after/plugin/codeium.lua

require('codeium').setup({
  config = {
    tools = {
      language_server = {
        cmd = "codeium",
      },
    },
  },
})

-- Add Codeium to nvim-cmp sources with styling
local cmp = require('cmp')
local config = cmp.get_config()

-- Add border to the completion window
config.window = {
  completion = cmp.config.window.bordered({
    border = "rounded",
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
  }),
  documentation = cmp.config.window.bordered({
    border = "rounded",
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
  }),
}

table.insert(config.sources, {
  name = 'codeium',
  priority = 1000,  -- High priority to show Codeium suggestions first
})
cmp.setup(config)

-- Keybindings
vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

-- Status in lualine (if you use it)
local function codeium_status()
  return vim.fn['codeium#GetStatusString']()
end

-- Add to lualine if you're using it
local has_lualine, lualine = pcall(require, 'lualine')
if has_lualine then
  lualine.setup {
    sections = {
      lualine_x = {
        codeium_status,
        'encoding',
        'fileformat',
        'filetype'
      }
    }
  }
end