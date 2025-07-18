-- UI and appearance plugins
return {
  {
    "vim-airline/vim-airline",
    event = "VimEnter",
  },
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = false,
        overrides = {},
      })
      vim.cmd("colorscheme ayu")
    end,
  },
  {
    "preservim/nerdtree",
    cmd = { "NERDTree", "NERDTreeToggle", "NERDTreeFind" },
    keys = {
      { "<leader>e", "<cmd>NERDTreeToggle<cr>", desc = "Toggle NERDTree" },
    },
    config = function()
      -- Basic NERDTree configuration
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeMinimalUI = 1
      vim.g.NERDTreeIgnore = { "^\\~$" }
    end,
  },
}