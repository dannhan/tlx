return  {
  "aznhe21/actions-preview.nvim",
  event = "VeryLazy",
  config = function()
    vim.keymap.set({ "v", "n" }, "<Leader>c", require("actions-preview").code_actions)
  end,
}

