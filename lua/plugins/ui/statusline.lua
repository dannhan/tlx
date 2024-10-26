return {
  -- Shows current code context
  {
    "SmiteshP/nvim-navic",
    {
      "utilyre/barbecue.nvim",
      init = function()
        -- HACK:
        -- workaround for the layout shift
        -- make the startup time a little bit slower
        local filename = vim.api.nvim_buf_get_name(0)
        vim.api.nvim_set_hl(0, "WinBarText", { bold = true })
        vim.opt.winbar = string.format("%%#WinBarBold#   %%*%%#WinBarText#%s%%*", vim.fn.fnamemodify(filename, ":t"))
      end,
      event = { "BufReadPre", "BufNewFile" },
      opts = {},
      -- opts = { attach_navic = false }
    },
  },
  -- Neovim statusline plugin written in pure lua.
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
      -- sections layout:
      -- +-------------------------------------------------+
      -- | A | B | C                             X | Y | Z |
      -- +-------------------------------------------------+
      sections = {
        lualine_a = {},
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
  -- Buffer / Tabline
  -- TODO: implement tab
  {
    "akinsho/bufferline.nvim",
    version = "*",
    init = function()
      -- HACK:
      -- workaround if the colorscheme not loaded first
      -- this might create some bugs in future
      vim.cmd.colorscheme("default")
    end,
    lazy = (vim.o.showtabline == 0),
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "slope",
        show_close_icon = false,
        custom_filter = function(buf_number)
          if vim.fn.bufname(buf_number) ~= "" then
            return true
          end
        end,
      },
    },
  },
  -- Status column plugin that provides a configurable 'statuscolumn' and click handlers.
  -- what you see on the leftside
  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    opts = function()
      local builtin = require("statuscol.builtin")
      return {
        relculright = true,
        segments = {
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          { text = { "%s" }, click = "v:lua.ScSa" },
        },
      }
    end,
  },
}
