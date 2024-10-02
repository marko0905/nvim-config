-- .config/nvim/lua/plugins/nvim-web-devicons.lua
return {
  "kyazdani42/nvim-web-devicons",
  lazy = false, -- Load immediately
  config = function()
    local devicons = require("nvim-web-devicons")

    -- Explicitly set the correct icons for JavaScript and TypeScript
    devicons.set_icon({
      js = {
        icon = "", -- JavaScript icon
        color = "#f1e05a",
        cterm_color = "185",
        name = "Javascript",
      },
      ts = {
        icon = "", -- TypeScript icon
        color = "#3178c6",
        cterm_color = "67",
        name = "Typescript",
      },
    })

    -- Optionally, log available icons to verify they are set correctly
    -- local icons = devicons.get_icons()
    -- for ext, icon in pairs(icons) do
    --   print(ext, icon.icon)
    -- end
  end,
}
