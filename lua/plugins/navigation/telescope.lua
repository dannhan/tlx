return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  cmd = { "Telescope" },
  keys = {
    { "<leader>pb", "<cmd>Telescope persisted theme=dropdown<CR>" },

    { "<leader>ss", "<cmd> Telescope builtin<CR>" },
    { "<leader>sf", "<cmd> Telescope find_files<CR>" },
    { "<leader>sh", "<cmd> Telescope help_tags<CR>" },
    { "<leader>sw", "<cmd> Telescope grep_string<CR>" },
    { "<leader>sg", "<cmd> Telescope live_grep<CR>" },
    { "<leader>sd", "<cmd> Telescope diagnostics<CR>" },
    { "<leader>st", "<cmd> Telescope colorscheme<CR>" },
    { "<leader>sr", "<cmd> Telescope resume<CR>" },
    { "<leader>sb", "<cmd> Telescope buffers<CR>" },
    -- telescope
    { "gd", "<cmd> Telescope lsp_definition<CR>" },
    { "<leader>gd", "<cmd> Telescope lsp_definition<CR>" },
  },
  config = function()
    local actions = require("telescope.actions")

    -- require("telescope").load_extension("persisted")

    require("telescope").setup({
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
      },
    })
  end,
}
