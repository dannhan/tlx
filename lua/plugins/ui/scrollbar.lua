return {
  -- Minimap
  {
    "gorbit99/codewindow.nvim",
    keys = {
      { "<leader>mo", "<cmd> lua require('codewindow').open_minimap()<CR>", desc = "[M]inimap [O]pen" },
      { "<leader>mc", "<cmd> lua require('codewindow').close_minimap()<CR>", desc = "[M]inimap [C]losed" },
      { "<leader>mm", "<cmd> lua require('codewindow').toggle_minimap()<CR>", desc = "[M]inimap Toggle" },
    },
    opts = {
      exclude_filetypes = { "help", "oil" }, -- Choose certain filetypes to not show minimap on
      minimap_width = 15, -- The width of the text part of the minimap
      screen_bounds = "background", -- How the visible area is displayed, "lines": lines above and below, "background": background color
      relative = "editor", -- What will be the minimap be placed relative to, "win": the current window, "editor": the entire editor
      show_cursor = false,
      window_border = "none",
    },
  },
  -- Decorated scrollbar
  {
    "lewis6991/satellite.nvim",
    event = "VeryLazy",
    opts = {
      handlers = {
        cursor = { enable = false },
        gitsigns = { enable = false },
      },
    },
  },
  -- Normal scrollbar
  {
    enable = false,
    "petertriho/nvim-scrollbar",
    opts = {},
  },
}
