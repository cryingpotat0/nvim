-- Key mappings
local keymap = vim.keymap.set

-- Buffer navigation
keymap("n", "<Tab>", ":bn<cr>", { desc = "Next buffer" })
keymap("n", "<S-Tab>", ":bp<cr>", { desc = "Previous buffer" })

-- Save control
keymap("n", "<leader>q", ":wq<cr>", { desc = "Save and quit" })
keymap("n", "<leader>w", ":w<cr>", { desc = "Save" })

-- Window resizing (Mac specific)
if vim.fn.has("macunix") == 1 then
  keymap("n", "∆", ":resize +2<CR>", { desc = "Resize down" })
  keymap("n", "˚", ":resize -2<CR>", { desc = "Resize up" })
  keymap("n", "¬", ":vertical resize -2<CR>", { desc = "Resize left" })
  keymap("n", "˙", ":vertical resize +2<CR>", { desc = "Resize right" })
else
  keymap("n", "<M-j>", ":resize +2<CR>", { desc = "Resize down" })
  keymap("n", "<M-k>", ":resize -2<CR>", { desc = "Resize up" })
  keymap("n", "<M-l>", ":vertical resize -2<CR>", { desc = "Resize left" })
  keymap("n", "<M-h>", ":vertical resize +2<CR>", { desc = "Resize right" })
end

-- Clear other buffers
keymap("n", "<leader>l", ":only<cr>", { desc = "Close other windows" })
keymap("n", "<leader>fn", ":file ", { desc = "Rename file" })

-- Insert newlines without going into insert mode
keymap("n", "<leader>O", "O<Esc>", { desc = "Insert line above" })
keymap("n", "<leader>o", "o<Esc>", { desc = "Insert line below" })

-- Better window navigation
keymap("n", "<C-h>", ":wincmd h<cr>", { desc = "Move to left window" })
keymap("n", "<C-j>", ":wincmd j<cr>", { desc = "Move to bottom window" })
keymap("n", "<C-k>", ":wincmd k<cr>", { desc = "Move to top window" })
keymap("n", "<C-l>", ":wincmd l<cr>", { desc = "Move to right window" })

-- Search highlighting
keymap("n", "<Leader><space>", ":noh<cr>", { desc = "Clear search highlights" })

-- Move lines up and down
keymap("n", "<leader>j", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<leader>k", ":m .-2<CR>==", { desc = "Move line up" })
keymap("v", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "<leader>k", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Quickfix helpers
keymap("n", "<leader>cn", ":cn<CR>", { desc = "Next quickfix" })
keymap("n", "<leader>cp", ":cp<CR>", { desc = "Previous quickfix" })
keymap("n", "<leader>cq", ":cclose<CR>", { desc = "Close quickfix" })

-- Claude Code
keymap("n", "<leader>cc", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code (vertical right)" })

-- Folding mappings
keymap("n", "zR", ":set foldlevel=99<CR>", { desc = "Open all folds" })
keymap("n", "zM", ":set foldlevel=0<CR>", { desc = "Close all folds" })
keymap("n", "za", "za", { desc = "Toggle fold under cursor" })
keymap("n", "zA", "zA", { desc = "Toggle fold recursively" })
keymap("n", "zo", "zo", { desc = "Open fold under cursor" })
keymap("n", "zc", "zc", { desc = "Close fold under cursor" })
keymap("n", "zj", "zj", { desc = "Move to next fold" })
keymap("n", "zk", "zk", { desc = "Move to previous fold" })

-- LSP mappings
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Insert current date/time
keymap("n", "<leader>tf", '"=strftime("%c")<CR>p', { desc = "Insert full time" })
keymap("n", "<leader>tt", '"=strftime("%a %d %b %Y")<CR>p', { desc = "Insert date" })

-- Yank current line into a buffer
keymap("n", "<leader>cl", function()
  local line = vim.fn.expand("%") .. ":" .. vim.fn.line(".")
  vim.fn.setreg("+", line)
end, { desc = "Copy file:line to clipboard" })

-- Yank current line into buffer with git remote link
keymap("n", "<leader>cg", function()
  local remote_url = vim.fn.system("git remote get-url origin"):gsub("\n", "")
  local repo_path = remote_url:gsub(".*github.com[:/](.*).git$", "%1")
  local commit_hash = vim.fn.system("git rev-parse HEAD"):gsub("\n", "")
  local file_path = vim.fn.expand("%")
  local line_num = vim.fn.line(".")
  
  local github_link = "https://github.com/" .. repo_path .. "/tree/" .. commit_hash .. "/" .. file_path .. "#L" .. line_num
  vim.fn.setreg("+", github_link)
end, { desc = "Copy GitHub link to clipboard" })

-- Terminal helpers
keymap("n", "<leader>tn", ":terminal<CR>", { desc = "Open terminal" })
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("t", "<leader><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("t", "<M-[>", "<Esc>", { desc = "Send escape to terminal" })
keymap("t", "<C-v><Esc>", "<Esc>", { desc = "Send escape to terminal" })