-- File: after/plugin/diagnostics.lua

-- Enhanced diagnostic navigation with preview
local function diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
      go({ severity = severity, float = true })
  end
end

-- Function to get diagnostic count for current buffer
local function get_diagnostic_counts()
  local counts = {0, 0, 0, 0} -- Error, Warn, Info, Hint
  local diagnostics = vim.diagnostic.get(0)
  for _, diagnostic in ipairs(diagnostics) do
      counts[diagnostic.severity] = counts[diagnostic.severity] + 1
  end
  return counts
end

-- Format diagnostic message with location
local function format_diagnostic(diagnostic)
  local message = diagnostic.message
  local lnum = diagnostic.lnum + 1
  local col = diagnostic.col + 1
  return string.format("[%d:%d] %s", lnum, col, message)
end

-- Show diagnostics in a floating window
local function show_diagnostics_float()
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr)
  if #diagnostics == 0 then
      vim.notify("No diagnostics available", vim.log.levels.INFO)
      return
  end

  local formatted_diagnostics = {}
  for _, d in ipairs(diagnostics) do
      local severity = vim.diagnostic.severity[d.severity]
      local icon = ({ERROR="", WARN="", INFO="", HINT=""})[severity]
      table.insert(formatted_diagnostics, string.format("%s %s: %s", 
          icon, severity, format_diagnostic(d)))
  end

  local opts = {
      relative = "cursor",
      width = 60,
      height = math.min(#formatted_diagnostics, 10),
      row = 1,
      col = 0,
      style = "minimal",
      border = "rounded"
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, formatted_diagnostics)
  vim.api.nvim_open_win(buf, false, opts)

  -- Auto-close the window
  vim.defer_fn(function()
      if vim.api.nvim_buf_is_valid(buf) then
          vim.api.nvim_buf_delete(buf, { force = true })
      end
  end, 5000)
end

-- Define custom diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- Update diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
      spacing = 4,
      prefix = "●",
      format = function(diagnostic)
          local severity_icons = {
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN] = "",
              [vim.diagnostic.severity.INFO] = "",
              [vim.diagnostic.severity.HINT] = "",
          }
          return string.format("%s %s", severity_icons[diagnostic.severity], diagnostic.message)
      end,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
  },
})

-- Note: Removed duplicate which-key registrations since they're now handled in which-key.lua