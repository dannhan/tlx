return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- stylua: ignore
  opts = {
    spec = {
      { "<leader>h",   group = "Harpoon" },
      { "<leader>m",   group = "Minimap" },

      { "<leader>e",   "<cmd> Oil<CR>",                     desc = "File Explorer" },

      { "<leader>s",   group = "Search" },
      { "<leader>sd",  "<cmd> Telescope diagnostics<CR>",   desc = "[S]earch [D]iagnostics" },
      { "<leader>sf",  "<cmd> Telescope find_files<CR>",    desc = "[S]earch [F]iles" },
      { "<leader>sg",  "<cmd> Telescope live_grep<CR>",     desc = "[S]earch by [G]rep" },
      { "<leader>sh",  "<cmd> Telescope help_tags<CR>",     desc = "[S]earch [H]elp" },
      { "<leader>sr",  "<cmd> Telescope resume<CR>",        desc = "[S]earch [R]esume" },
      { "<leader>ss",  "<cmd> Telescope builtin<CR>",       desc = "[S]earch [S]elect Telescope" },
      { "<leader>sc",  "<cmd> Telescope colorscheme<CR>",   desc = "[S]earch [C]olor" },
      { "<leader>st",  "<cmd> Telescope todo-comments<CR>", desc = "[S]earch [T]odo" },
      { "<leader>sw",  "<cmd> Telescope grep_string<CR>",   desc = "[S]earch current [W]ord" },
      { "<leader>sm",  "<cmd> Telescope marks<CR>",         desc = "[S]earch [M]arks" },

      { "<Tab>",       "<cmd> BufferLineCycleNext <CR>",    desc = "Buffer Next" },
      { "<S-Tab>",     "<cmd> BufferLineCyclePrev <CR>",    desc = "Buffer Prev" },
      { "<C-x>",       "<cmd> bdelete<CR>",                 desc = "Buffer Delete" },

      { "<leader>b",   group = "Buffer" },
      { "<leader>bd",  "<cmd> bdelete<CR>",                 desc = "[B]uffer [D]elete Current" },
      { "<leader>bn",  "<cmd> BufferLineCycleNext <CR>",    desc = "[B]uffer [N]ext" },
      { "<leader>bp",  "<cmd> BufferLineCyclePrev <CR>",    desc = "[B]uffer [P]revious" },
      { "<leader>bt",  "<cmd> ToggleBufferline<CR>",        desc = "[B]ufferline [T]oggle" },

      { "<leader>bc",   group = "Buffer Close" },
      { "<leader>bcp", "<cmd> BufferLinePickClose <CR>",    desc = "[B]uffer [C]lose [P]ick" },
      { "<leader>bco", "<cmd> BufferLineCloseOthers<CR>",   desc = "[B]uffer [C]lose [O]ther" },
      { "<leader>bcl", "<cmd> BufferLineCloseLeft<CR>",     desc = "[B]uffer [C]lose [L]eft" },
      { "<leader>bcr", "<cmd> BufferLineCloseRight<CR>",    desc = "[B]uffer [C]lose [R]ight" },

      -- NORMAL and VISUAL mode
      {
        mode = { "n", "v", "x" },
        { "<leader>c", "<cmd>lua require('actions-preview').code_actions()<CR>", desc = "Code Action" },
      },
    },
    -- Configs --
    delay = 500,
    icons = {
      breadcrumb = "»",               -- symbol used in the command line area that shows your active key combo
      separator = "➜",                -- symbol used between a key and it's label
      group = "+",                    -- symbol prepended to a group
    },
    win = {
      no_overlap = false,             -- the no_overlap make the height inconsistent, idk why
      border = "rounded",             -- none, single, double, shadow, rounded
      padding = { 2, 2, 2, 2 },       -- extra window padding [top, right, bottom, left]
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 4,                    -- spacing between columns
      align = "left",                 -- align columns left, center or right
    },
    show_help = true,                 -- show help message on the command line when the popup is visible
  },
}
