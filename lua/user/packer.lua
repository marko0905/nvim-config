-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  --Telescope plugin --In
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  --Telescope plugin --Out

  --Rose Pine theme --In
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  })
  --Rose Pine theme --Out

  --Treesitter plugin --In
  use(
    "nvim-treesitter/nvim-treesitter",
    { run = ":TSUpdate" }
  )
  --Treesitter plugin --Out

  --nvim-lspconfig plugin --In
  use("neovim/nvim-lspconfig")
  --nvim-lspconfig plugin --Out

  --for auto suggestion --In
  use 'hrsh7th/nvim-cmp'          -- Completion plugin
  use 'hrsh7th/cmp-nvim-lsp'      -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'        -- Buffer source for nvim-cmp
  use 'hrsh7th/cmp-path'          -- Path source for nvim-cmp
  use 'hrsh7th/cmp-cmdline'       -- Command-line source for nvim-cmp
  use 'L3MON4D3/LuaSnip'          -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'  -- Snippet source for nvim-cmp
  --for auto suggestion --Out

  --which-key plugin --In
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
    --for web devicons --In
    use 'nvim-tree/nvim-web-devicons' -- Required for icons
    --for web devicons --Out

    --for mini-icons --In
    use 'echasnovski/mini.icons'
    --for mini-icons --Out
  --which-key plugin --Out

  --bufferline plugin --In
  use { 
    'akinsho/nvim-bufferline.lua', 
    requires = 'nvim-tree/nvim-web-devicons' -- Icons for bufferline
  }
  --bufferline plugin --Out

  --nvim-tree plugin --in
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- Optional, for file icons
    },
  }
  --nvim-tree plugin --Out

  --noice.nvim plugin --In
  use {
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim", -- UI component library
      "rcarriga/nvim-notify", -- Notification manager
    }
  }
  --noice.nvim plugin --Out

  --lualine.nvim plugin --In
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  --lualine.nvim plugin --Out

  --Coment.nvim plugin --In
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  --Coment.nvim plugin --Out

  --trouble.nvim plugin --In
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons", -- For icons
    config = function()
      require("trouble").setup {}
    end
  }
  --trouble.nvim plugin --Out

  --nvim-ts-autotag plugin --In
  use {
    'windwp/nvim-ts-autotag',
    requires = { 'nvim-treesitter/nvim-treesitter' } -- Ensure Treesitter is installed
  }
  --nvim-ts-autotag plugin --Out

  -- Codeium plugin --In
  use {
    'Exafunction/codeium.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup({})
    end
  }
  -- Codeium plugin --Out



end)
