-- LSP and language server plugins
return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Basic LSP setup - servers need to be installed manually via Mason
      local lspconfig = require("lspconfig")
      
      -- Only setup servers that are available
      local servers = { "lua_ls", "rust_analyzer", "tsserver" }
      
      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = "rust",
    config = function()
      require("rust-tools").setup()
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript").setup({
        server = {
          on_attach = function(client, bufnr)
            -- Add any TypeScript-specific configuration here
          end,
        },
      })
    end,
  },
}