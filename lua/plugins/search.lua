-- Search and fuzzy finding plugins
return {
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    cmd = { "Files", "Rg", "Buffers", "History" },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>F", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help tags" },
      { "<leader>gg", "<cmd>FzfLua grep<cr>", desc = "Grep" },
      { "<leader>gp", "<cmd>FzfLua grep_project<cr>", desc = "Grep project" },
      { "<leader>h", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
      { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Git branches" },
    },
    config = function()
      require("fzf-lua").setup({
        winopts = {
          height = 0.85,
          width = 0.80,
          preview = {
            vertical = "down:45%",
            horizontal = "right:50%",
          },
        },
      })
    end,
  },
}