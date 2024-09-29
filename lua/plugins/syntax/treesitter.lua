return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
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
    -- ft = { "astro", "html", "javascriptreact", "typescriptreact", "svelte" },
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ["html"] = {
            enable_close = false,
          },
        },
      })
    end,
  },
  {
    -- HIGHLIGHT ARGUMENTS' DEFINITIONS AND USAGES, USING TREESITTER
    "m-demare/hlargs.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    config = true,
  },
}
