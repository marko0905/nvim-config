require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { 
    "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", 
    "markdown", "markdown_inline", "html", "tsx" -- Add "html" and "tsx" parsers
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- Enable autotag
  autotag = {
    enable = true, -- Activates nvim-ts-autotag for supported languages
  },
}
