return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>e", "<cmd> Oil<CR>", desc = "File Explorer" },

      { "<leader>h", group = "Harpoon" },

      { "<leader>s", group = "Search" },
      { "<leader>sd", "<cmd> Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
      { "<leader>sf", "<cmd> Telescope find_files<CR>", desc = "[S]earch [F]iles" },
      { "<leader>sg", "<cmd> Telescope live_grep<CR>", desc = "[S]earch by [G]rep" },
      { "<leader>sh", "<cmd> Telescope help_tags<CR>", desc = "[S]earch [H]elp" },
      { "<leader>sr", "<cmd> Telescope resume<CR>", desc = "[S]earch [R]esume" },
      { "<leader>ss", "<cmd> Telescope builtin<CR>", desc = "[S]earch [S]elect Telescope" },
      { "<leader>sc", "<cmd> Telescope colorscheme<CR>", desc = "[S]earch [C]olor" },
      { "<leader>st", "<cmd> Telescope todo-comments<CR>", desc = "[S]earch [T]odo" },
      { "<leader>sw", "<cmd> Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },

      { "<leader>b", group = "Buffer" },
      { "<leader>bn", "<cmd> bnext<CR>", desc = "[B]uffer [N]ext" },
      { "<leader>bp", "<cmd> bprevious<CR>", desc = "[B]uffer [P]revious" },
      { "<leader>bt", "<cmd> ToggleBufferline<CR>", desc = "[B]ufferline [T]oggle" },

      { "<leader>bd", group = "Buffer Delete" },
      { "<leader>bdc", "<cmd> bdelete<CR>", desc = "[B]uffer [D]elete [C]urrent" },
      { "<leader>bda", "<cmd> :%bd|edit#|bd#<CR>", desc = "[B]uffer [D]elete [A]ll except current" },

      {
        mode = { "n", "v", "x" }, -- NORMAL and VISUAL mode
        { "<leader>c", "<cmd>lua require('actions-preview').code_actions()<CR>", desc = "Code Action" },
      },
    },
    -- Configs --
    delay = 500,
    win = {
      -- the no_overlap make the height inconsistent, idk why
      no_overlap = false,
    },
  },
}
