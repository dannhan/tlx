-- TODO:
-- is it possible to make the value of lazy dynamic?
-- might merge this with other
return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  lazy = false,
  opts = {
    keymaps = {
      ["g?"] = "actions.show_help",
      ["l"] = "actions.select",
      ["h"] = "actions.parent",
      ["zh"] = "actions.toggle_hidden",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["."] = "actions.cd",
      ["<C-s>"] = "",
      ["<C-h>"] = "",
    },
  },
}
