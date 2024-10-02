return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- import mason-tool-installer
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- configure mason-lspconfig
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver", -- typescript-language-server
        "html", -- vscode-html-languageserver
        "cssls", -- vscode-css-languageserver
        "tailwindcss", -- tailwindcss-lsp
        "svelte", -- svelte-language-server
        "lua_ls", -- lua-language-server (sumneko_lua)
        "graphql", -- graphql-language-service
        "emmet_ls", -- emmet-ls
        "prismals", -- prisma-language-server
      },
    })

    -- configure mason-tool-installer
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d", -- eslint daemon
      },
    })
  end,
}
