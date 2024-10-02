-- .config/nvim/marko/plugins/bufferline.lua

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("bufferline").setup({
      options = {
        -- mode = "tabs",
        -- separator_style = "slant", -- Choose 'slant' for sloped/angled tabs
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        indicator = {
          icon = "▎",
          style = "underline",
        },
        diagnostics = "nvim_lsp",
        -- separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = true,
      },
    })

    -- key mappings
    vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

    -- Function to close the current buffer and move to the next available one
    local function close_buffer_and_go_to_next()
      local bufnr = vim.api.nvim_get_current_buf()
      -- Move to the next buffer
      vim.cmd("BufferLineCycleNext")
      -- Close the current buffer
      vim.cmd("bdelete " .. bufnr)
    end

    -- Key mapping to close buffer and move to the next one using <leader>x
    vim.keymap.set("n", "<leader>x", close_buffer_and_go_to_next, { desc = "Close current buffer and go to the next" })
  end,
}
