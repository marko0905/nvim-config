return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- "nvim-tree/nvim-web-devicons",
    -- "folke/todo-comments.nvim",
    --aded this ↓
    "nvim-telescope/telescope-file-browser.nvim",
    enabled = true,
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
      extensions = {
        file_browser = {
          -- theme = "dropdown",
          -- theme = "cursor",
          theme = "ivy",
          layout_strategy = "horizontal",
          layout_config = {
            width = 0.9,
            -- width = 0.7,
            height = 0.9,
            -- height = 0.6,
            -- preview_width = 0.6,
            preview_width = 0.4,
          },
          -- border = true,
          sorting_strategy = "ascending",
          grouped = true,
          hidden = true,
          hide_parent_dir = false,
          hijack_netrw = true,
          prompt_path = true,
          -- use_fd = true,
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "-", "<cmd>Telescope file_browser<cr>", { desc = "File browser" })

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    -- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    -- keymap.set("n", "<leader>fc", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set(
      "n",
      "<leader>fc",
      "<cmd>spell_suggest_telescope<cr>",
      { desc = "Find suggestions for word under cursor" }
    )
  end,
}
