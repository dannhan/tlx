return {
  'stevearc/oil.nvim',
  lazy = false,
  config = function()
    require("oil").setup({
      keymaps = {
        ["g?"]    = "actions.show_help",
        ["l"]     = "actions.select",
        ["h"]     = "actions.parent",
        ["zh"]    = "actions.toggle_hidden",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["."]     = "actions.cd",
        ["<C-s>"] = "",
      },
    })
    vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "FileExplorer" })
  end,
}
