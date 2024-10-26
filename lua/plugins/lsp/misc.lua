return {
  {
    -- TODO: test if this work, change keybinding
    "aznhe21/actions-preview.nvim",
    opts = {},
  },

  -- Extensible UI for Neovim notifications and LSP progress messages.
  {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- options
    },
  },
}
