-- Language specific settings and overrides
vim.cmd("filetype plugin on")

-- Python specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.foldmethod = "indent"
  end,
})