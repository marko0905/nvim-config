-- File: after/plugin/lualine.lua

local function lsp_clients()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #clients == 0 then
    return "No LSP"
  end

  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return table.concat(names, ", ")
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
    globalstatus = true,
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
    lualine_b = { 'branch', { 'diff', symbols = { added = ' ', modified = '柳 ', removed = ' ' } } },
    lualine_c = { 'filename', { lsp_clients } }, -- Add LSP client display here
    lualine_x = { { 'diagnostics', sources = { 'nvim_lsp' }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } } },
    lualine_y = { 'filetype', 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { 'nvim-tree', 'quickfix', 'fugitive' },
}
