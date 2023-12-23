return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    lazy = false,
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    config = function()
      require("barbecue").setup({
        attach_navic = false,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        sections = {
          lualine_c = {
            {
              "filename",
              file_status = true,   -- displays file status (readonly status, modified status)
              path = 1,             -- relative path
              shorting_target = 40, -- Shortens path to leave 40 space in the window
            },
          },
        },
      })
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          { text = { "%s" },                  click = "v:lua.ScSa" },
        },
      })
    end,
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   version = "v3.*",
  --   dependencies = 'nvim-tree/nvim-web-devicons', lazy = false,
  --   config = function()
  --     require("bufferline").setup({
  --       options = {
  --         mode = "buffers",
  --         separator_style = "thick",
  --         diagnostics = "nvim_lsp",
  --         custom_filter = function(buf_number)
  --           if vim.bo[buf_number].filetype ~= "qf" then
  --             return true
  --           end
  --           if vim.bo[buf_number].filetype ~= "oil" then
  --             return true
  --           end
  --         end,
  --       },
  --       highlights = { tab = { fg = "#CCCCCC" } },
  --     })
  --   end
  -- }
}
