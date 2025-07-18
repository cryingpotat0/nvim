-- Claude Code plugin
return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      -- Terminal window settings
      window = {
        split_ratio = 0.3,      -- 30% of screen width for vertical split
        position = "vertical",  -- Vertical split on the right
        enter_insert = true,    -- Enter insert mode when opening Claude Code
        hide_numbers = true,    -- Hide line numbers in the terminal window
        hide_signcolumn = true, -- Hide the sign column in the terminal window
      },
    })
  end,
}