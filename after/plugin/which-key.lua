local wk = require("which-key")

wk.add({
  { "<leader>f", group = "FZF" }, -- group
  { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  {
    mode = { "n", "v" }, -- NORMAL and VISUAL mode

    -- --> Help group
    { "<leader>h", group = "Help Commands" }, -- group
    { "<leader>hq", "<cmd>q<cr>", desc = "Quit" },
    { "<leader>hQ", "<cmd>qa<cr>", desc = "Quit All" },
    { "<leader>hw", "<cmd>w<cr>", desc = "Write" },
    {"<leader>hs", "z=", desc = "Spell Suggestions" },
    { "<leader>hd", "<cmd>Trouble<cr>", desc = "Toggle Diagnostics", mode = "n" },
    -- <--

    -- --> Buffer group
    {"<leader>b", group = "Buffer Commands",},
    -- Next buffer
    { "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer", mode = "n" },
    -- Previous buffer
    { "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous Buffer", mode = "n" },
    -- Close current buffer
    { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete Buffer", mode = "n" },
    -- Create a new buffer
    { "<leader>bb", "<cmd>enew<cr>", desc = "New Buffer", mode = "n" },
    -- <--

    -- --> Package management
    --Packer
    {"<leader>p", group = "Package Management",},
    {"<leader>ps", "<cmd>Lazy sync<cr>", desc = "Lazy Sync", mode = "n"},
    {"<leader>pi", "<cmd>Lazy install<cr>", desc = "Lazy Install", mode = "n"},
    {"<leader>pu", "<cmd>Lazy update<cr>", desc = "Lazy Update", mode = "n"},
    {"<leader>pp", "<cmd>Lazy profile<cr>", desc = "Lazy Profile", mode = "n"},
    -- Mason commands
    {"<leader>pm", "<cmd>Mason<cr>", desc = "Mason UI", mode = "n"},
    {"<leader>pM", "<cmd>MasonUpdate<cr>", desc = "Mason Update", mode = "n"},
    {"<leader>pl", "<cmd>Mason log<cr>", desc = "Mason Log", mode = "n"},
    -- <--

    -- -->nvim-tree
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Tree", mode = "n" },
    -- <--

    -- --> Noice group
    { "<leader>n", group = "Noice Commands" },
    { "<leader>nh", "<cmd>Noice history<cr>", desc = "Show Message History", mode = "n" },
    { "<leader>nl", "<cmd>Noice last<cr>", desc = "Show Last Message", mode = "n" },
    { "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Dismiss All Messages", mode = "n" },
    -- <--

    -- --> Comment.nvim
    { "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Toggle Line Comment", mode = "n" }, -- Line comment in Normal mode
    -- <--

    -- --> Yank to clipboard +
    { "<leader>c", '"+y', desc = "Yank to Clipboard", mode = "v" },
    -- <--

    -- --> Moving
    { "<leader>m", group = "Move Commands" },
    { "<leader>mh", "<<", desc = "Move selected left", mode = "v" },
    { "<leader>ml", ">>", desc = "Move selected right", mode = "v" },
    { "<leader>mk", ":m '<-2<CR>gv=gv", desc = "Move Selected Up", mode = "v" },
    { "<leader>mj", ":m '>+1<CR>gv=gv", desc = "Move Selected Down", mode = "v" },
    -- <--

  }
})
