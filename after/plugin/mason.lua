-- File: after/plugin/mason.lua

require("mason").setup({
  ui = {
      border = "rounded",
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      },
      keymaps = {
          toggle_package_expand = "<CR>",
          install_package = "i",
          update_package = "u",
          check_package_version = "c",
          update_all_packages = "U",
          check_outdated_packages = "C",
          uninstall_package = "X",
          cancel_installation = "<C-c>",
          apply_language_filter = "<C-f>",
      },
  },
})

-- Mason LSPconfig
require("mason-lspconfig").setup({
  ensure_installed = {
      "lua_ls",
      "ts_ls",
      "html",
      "cssls",
      "jsonls",
      "eslint",
  },
  automatic_installation = true,
})

-- Integrate with existing LSP configuration
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

-- Get the servers that mason installed
local installed_servers = mason_lspconfig.get_installed_servers()

-- Setup handlers for mason-installed servers
mason_lspconfig.setup_handlers({
  function(server_name)
      local opts = {
          capabilities = require('cmp_nvim_lsp').default_capabilities(
              vim.lsp.protocol.make_client_capabilities()
          ),
      }
      
      -- Add any server-specific settings
      if server_name == "lua_ls" then
          opts.settings = {
              Lua = {
                  diagnostics = {
                      globals = { 'vim' }
                  }
              }
          }
      end
      
      lspconfig[server_name].setup(opts)
  end
})