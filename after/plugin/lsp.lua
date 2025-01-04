-- File: lsp.lua
local lspconfig = require('lspconfig')

-- TypeScript and JavaScript (using ts_ls)
lspconfig.ts_ls.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
}

-- Lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- Use LuaJIT for Neovim
      },
      diagnostics = {
        globals = { 'vim' }, -- Recognize `vim` as a global variable
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Neovim runtime files
        checkThirdParty = false, -- Disable telemetry prompt
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Node.js JSON Support
lspconfig.jsonls.setup {}

-- Node.js ESLint
lspconfig.eslint.setup {}

-- HTML
lspconfig.html.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
}

-- CSS
lspconfig.cssls.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
}

-- Configure diagnostics globally
vim.diagnostic.config({
  virtual_text = {
    prefix = "", -- Icon or text to show before the message
    spacing = 2, -- Space between the line and diagnostic message
    source = "always", -- Show the diagnostic source (e.g., "eslint", "lua-ls")
    severity = nil, -- Only show diagnostics of certain severities (nil shows all)
    format = function(diagnostic)
      return string.format("%s [%s]", diagnostic.message, diagnostic.source)
    end,
  },
  signs = true, -- Show signs in the sign column
  underline = true, -- Underline the problem
  update_in_insert = false, -- Update diagnostics in insert mode
  severity_sort = true, -- Sort diagnostics by severity
  float = {
    border = "rounded", -- Rounded border for floating diagnostics
    source = "always", -- Show the source of the diagnostic in the float
  },
})