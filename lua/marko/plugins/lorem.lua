return {
  "derektata/lorem.nvim",
  lazy = false, -- Load immediately
  config = function()
    local lorem = require("lorem")

    -- Configure the options directly
    lorem.sentenceLength = "medium" -- Medium-length sentences
    lorem.comma_chance = 0.2 -- 20% chance to insert commas
    lorem.max_commas_per_sentence = 2 -- Max 2 commas per sentence
  end,
}
