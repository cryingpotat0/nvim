-- Language specific settings and overrides
vim.cmd("filetype plugin on")

-- Language-specific folding settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "yaml", "json" },
  callback = function()
    -- For indent-based languages, use indent folding
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldlevel = 99
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact", "lua", "rust", "go", "c", "cpp", "java", "html", "css" },
  callback = function()
    -- For languages with good treesitter support, use treesitter folding
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt_local.foldlevel = 99
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vim", "bash", "sh", "zsh" },
  callback = function()
    -- For vim and shell scripts, use syntax folding
    vim.opt_local.foldmethod = "syntax"
    vim.opt_local.foldlevel = 99
  end,
})