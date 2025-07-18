-- General settings
vim.opt.compatible = false
vim.cmd("syntax on")
vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"

-- Set correct python
vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/venv/bin/python")

-- Line Numbering
vim.opt.number = true
vim.opt.ruler = true
vim.opt.relativenumber = true

-- Set Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

-- Folding configuration
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99  -- Start with all folds open
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Auxiliary options
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.indentexpr = ""
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.cmdheight = 2
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.clipboard = "unnamedplus"
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true

-- Auto source when writing to init.lua
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*/nvim/init.lua", "*/nvim/lua/**/*.lua" },
  callback = function()
    vim.cmd("source %")
  end,
})

-- Terminal highlighting
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.wo.winhighlight = "Normal:BlackBg"
  end,
})

vim.api.nvim_set_hl(0, "BlackBg", { bg = "LightGreen" })