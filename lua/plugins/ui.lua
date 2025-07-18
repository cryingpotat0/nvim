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
        terminal = true,
        overrides = {},
      })
      vim.cmd("colorscheme ayu-light")
      
      -- Set up colorcolumn
      vim.opt.termguicolors = true
      vim.g.colorcolumn_enabled = 1
      vim.opt.colorcolumn = "100"
      
      -- Function to cycle colorcolumn
      function CycleColorColumn()
        if vim.g.colorcolumn_enabled == 0 then
          vim.opt.colorcolumn = "100"
          vim.cmd("highlight ColorColumn ctermbg=1 guibg=lightgrey")
          vim.g.colorcolumn_enabled = 1
        else
          vim.opt.colorcolumn = "0"
          vim.g.colorcolumn_enabled = 0
        end
      end
      
      -- Set up keymapping for F3
      vim.keymap.set("n", "<F3>", CycleColorColumn, { desc = "Cycle color column" })
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = {
      { "<C-a>", function()
          require("oil").open_float()
        end, desc = "Open file directory in floating window" },
      { "<leader>e", function()
          require("oil").open_float()
        end, desc = "Open file directory in floating window" },
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == '..' or name == '.git'
          end,
        },
        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        use_default_keymaps = true,
      })
    end,
  },
}