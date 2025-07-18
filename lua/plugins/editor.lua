-- Editor enhancement plugins
return {
  {
    "tpope/vim-commentary",
    event = "VeryLazy",
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
      { "<leader>gb", "<cmd>Gblame<cr>", desc = "Git blame" },
    },
  },
  {
    "sbdchd/neoformat",
    cmd = { "Neoformat" },
    keys = {
      { "<leader>f", "<cmd>Neoformat<cr>", desc = "Format file" },
    },
  },
}