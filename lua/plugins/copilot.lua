-- Copilot plugins
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        -- Disable native suggestion and panel to work with blink-cmp-copilot
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
}