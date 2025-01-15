-- nvim/after/plugin/lsp.lua
-- File: lsp.lua
local lspconfig = require('lspconfig')

-- Create shared capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Define servers with their specific settings
local servers = {
  -- Go
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  },

  -- Nix
  nil_ls = {
    settings = {
      ['nil'] = {
        formatting = {
          command = { "nixpkgs-fmt" },
        },
      },
    },
  },

  -- TypeScript and JavaScript
  ts_ls = {},
  
  -- Lua
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  
  -- JSON
  jsonls = {},
  
  -- ESLint
  eslint = {},
  
  -- HTML
  html = {},
  
  -- CSS
  cssls = {},
}

-- Setup each LSP server with consistent capabilities
for server, config in pairs(servers) do
  -- Merge server-specific settings with shared capabilities
  config.capabilities = capabilities
  
  -- Setup the server
  lspconfig[server].setup(config)
end

-- Configure diagnostics globally
vim.diagnostic.config({
  virtual_text = {
    prefix = "",
    spacing = 2,
    source = "always",
    severity = nil,
    format = function(diagnostic)
      return string.format("%s [%s]", diagnostic.message, diagnostic.source)
    end,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

-- LSP Keybindings with which-key integration
local wk = require("which-key")

wk.add({
  {
    mode = { "n" },
    { "<leader>l", group = "LSP Commands" },
    { "<leader>ld", vim.lsp.buf.definition, desc = "Go to Definition" },
    { "<leader>lD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
    { "<leader>lr", vim.lsp.buf.references, desc = "Find References" },
    { "<leader>li", vim.lsp.buf.implementation, desc = "Go to Implementation" },
    { "<leader>lt", vim.lsp.buf.type_definition, desc = "Type Definition" },
    { "<leader>lk", vim.lsp.buf.hover, desc = "Hover Documentation" },
    { "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature Help" },
    { "<leader>ln", vim.lsp.buf.rename, desc = "Rename Symbol" },
    { "<leader>la", vim.lsp.buf.code_action, desc = "Code Actions" },
    { "<leader>lf", vim.lsp.buf.format, desc = "Format Document" },
    { "<leader>le", vim.diagnostic.open_float, desc = "Show Line Diagnostics" },
    { "<leader>lq", vim.diagnostic.setloclist, desc = "Set Location List" },
    { "<leader>lw", vim.diagnostic.setqflist, desc = "Set Quickfix List" },
    { "[d", vim.diagnostic.goto_prev, desc = "Previous Diagnostic" },
    { "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
  }
})