local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example of converting plugins from packer to lazy format
require("lazy").setup({
  -- UI
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "akinsho/nvim-bufferline.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  
  -- LSP and Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
  },
  
  -- Tree-sitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "windwp/nvim-ts-autotag" },
  
  -- File Explorer and Navigation
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "NvimTreeToggle",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  
  -- Utilities
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "TroubleToggle",
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  
  -- Mini plugins
  { "echasnovski/mini.icons", version = false },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
}) 