return {
  -- JELEK
  -- {
  --   -- LSP VIRTUAL TEXT
  --   "dgagn/diagflow.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  -- },
  {
    -- LSP BREADCRUMBS NAVIGATION
    "SmiteshP/nvim-navbuddy",
    opts = { lsp = { auto_attach = true } },
    lazy = false,
    -- cmd = "NavBuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    -- LSP DIAGNOSTICS
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("trouble").setup()

      local bufopts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>tc", "<Cmd>TroubleClose<CR>", bufopts)
      vim.keymap.set("n", "<leader>td", "<Cmd>TroubleToggle document_diagnostics<CR>", bufopts)
      vim.keymap.set("n", "<leader>tw", "<Cmd>TroubleToggle workspace_diagnostics<CR>", bufopts)
      vim.keymap.set("n", "<leader>tr", "<Cmd>TroubleToggle lsp_references<CR>", bufopts)
      vim.keymap.set("n", "<leader>tq", "<Cmd>TroubleToggle quickfix<CR>", bufopts)
      vim.keymap.set("n", "<leader>tl", "<Cmd>TroubleToggle loclist<CR>", bufopts)

      vim.keymap.set("n", "<leader><leader>ln", function()
        require("trouble").next({ skip_groups = false, jump = true });
      end, { desc = "Next item" })
      vim.keymap.set("n", "<leader><leader>lp", function()
        require("trouble").previous({ skip_groups = false, jump = true });
      end, { desc = "Prev item" })
    end
  },
}
