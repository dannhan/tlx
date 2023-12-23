return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
        autotag = {
          enable = true,
          enable_close_on_slash = false,
        },
        ensure_installed = {},
        modules = {},
        ignore_install = {},
      })

      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
          tsx = "rainbow-parens",
          -- javascript = 'rainbow-parens',
        },
        highlight = {
          "RainbowDelimiterCyan",
          "RainbowDelimiterViolet",
          "RainbowDelimiterGreen",
        },
      }
    end,
  },
  {
    -- MARKDOWN AUTO TAGS
    "windwp/nvim-ts-autotag",
    ft = { "astro", "html", "javascriptreact", "typescriptreact" },
  },
  {
    -- HIGHLIGHT ARGUMENTS' DEFINITIONS AND USAGES, USING TREESITTER
    "m-demare/hlargs.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    config = true
  },
  {
    -- SHOWS THE CONTEXT OF THE CURRENTLY VISIBLE BUFFER CONTENTS
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = { separator = "-" }
  },
}
