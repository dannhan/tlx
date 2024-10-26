-- TODO: learn more about telescope features
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  cmd = { "Telescope" },
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        mappings = {
          i = {
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
            ["<Esc>"] = actions.close,
          },
        },
      },
      pickers = {
        builtin = { theme = "ivy" },
        find_files = { theme = "ivy" },
        help_tags = { theme = "ivy" },
        grep_string = { theme = "ivy" },
        live_grep = { theme = "ivy" },
        sessions = { theme = "ivy" },
        colorscheme = { theme = "dropdown", enable_preview = true },
        marks = { theme = "dropdown", enable_preview = true },
        lsp_definitions = { theme = "dropdown", enable_preview = true },
      },
    }
  end,
}
