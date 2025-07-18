-- Editor enhancement plugins
return {
  {
    "tpope/vim-commentary",
    event = "VeryLazy",
    keys = {
      { "<leader><leader>", "<cmd>Commentary<cr>", desc = "Toggle comment", mode = { "n", "v" } },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit" },
    keys = {
      { "<leader>G", "<cmd>Git<cr>", desc = "Git status" },
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