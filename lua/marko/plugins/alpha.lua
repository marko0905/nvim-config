return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "                                                     ",
      "  ██     ██ ███████  ██████  ██    ██ ██ ███    ███  ",
      "  ████   ██ ██      ██    ██ ██    ██ ██ ████  ████  ",
      "  ██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██  ",
      "  ██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██  ",
      "  ██   ████ ███████  ██████    ████   ██ ██      ██  ",
      "                                                     ",
      "                                                     ",
      "                                              -By 2M ",
      "                                                     ",
      "                                                     ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("-", "  > Toggle file explorer", "<cmd>Telescope file_browser<cr>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button(":Lazy", "󰒲 > Lazy.nvim", "<cmd>Lazy<CR>"),
      dashboard.button(":Mason", "󱌢 > Mason.nvim", "<cmd>Mason<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
