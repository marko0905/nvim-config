-- Define custom diagnostic signs for LSP
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- Customize floating diagnostic window
vim.diagnostic.config({
  virtual_text = false, -- Disable virtual text
  signs = true, -- Enable signs
  update_in_insert = false, -- Don't update diagnostics while in insert mode
  underline = true, -- Underline problematic code
  severity_sort = true, -- Sort diagnostics by severity
  float = {
    border = "rounded", -- Rounded border for floating windows
    source = "always", -- Always include the diagnostic source
    header = "",
    prefix = "",
  },
})

