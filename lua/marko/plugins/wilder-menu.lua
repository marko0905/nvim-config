-- Description: Configure the wilder.nvim plugin
-- .config/nvim/lua/marko/plugins/wilder-menu.lua

return {
  {
    "gelguy/wilder.nvim",
    lazy = false, -- Ensure the plugin is always available
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local wilder = require("wilder")

      -- Enable wilder for command, search, and substitute modes
      wilder.setup({ modes = { ":", "/", "?" } })

      -- Set keybindings using set_option
      wilder.set_option("pipeline", {
        wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
      })

      -- Set the renderer options with border theme and transparency
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
          highlights = { default = "StatusLine" },
          highlighter = wilder.basic_highlighter(),
          separator = " · ",
          left = { " ", wilder.wildmenu_spinner(), " " },
          -- right = { " ", wilder.wildmenu_index() },
          right = { " ", wilder.popupmenu_scrollbar(), " " },
          border = "rounded", -- Border style (can be 'rounded', 'single', or 'double')
          pumblend = 0, -- Transparency level (0 = no transparency, 20 = light transparency)
          padding = { 0, 0, 0, 0 }, -- Padding (top, right, bottom, left)
          margin = { 0, 0, 0, 0 }, -- Margin (top, right, bottom, left)
          min_width = "100%", -- Minimum width of the popup menu
          min_height = 25, -- Minimum height of the popup menu
          max_height = 25, -- Maximum height of the popup menu
        }))
      )

      -- Optionally set key mappings
      wilder.set_option("next_key", "<Tab>")
      wilder.set_option("previous_key", "<S-Tab>")
      wilder.set_option("accept_key", "<Down>")
      wilder.set_option("reject_key", "<Up>")
    end,
  },
}
