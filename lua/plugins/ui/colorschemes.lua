-- collection of colorschemes
-- TODO: https://github.com/folke/lazy.nvim/discussions/1167
return {
  { "neanias/everforest-nvim", event = "VeryLazy", name = "everforest", opts = { background = "hard" } },
  { "bluz71/vim-moonfly-colors", event = "VeryLazy", name = "moonfly" },
  { "rose-pine/neovim", event = "VeryLazy", name = "rose-pine" },
  { "catppuccin/nvim", event = "VeryLazy", name = "catppuccin" },
  { "EdenEast/nightfox.nvim", event = "VeryLazy" },
  { "arturgoms/moonbow.nvim", event = "VeryLazy" },
  { "folke/tokyonight.nvim", event = "VeryLazy" },
  { "ellisonleao/gruvbox.nvim", event = "VeryLazy" },
  { "navarasu/onedark.nvim", event = "VeryLazy" },
  { "Shatur/neovim-ayu", event = "VeryLazy" },
  { "sho-87/kanagawa-paper.nvim", event = "VeryLazy" },
  { "scottmckendry/cyberdream.nvim", event = "VeryLazy" },
  { "sainnhe/sonokai", event = "VeryLazy" },
  {
    "rebelot/kanagawa.nvim",
    event = "VeryLazy",
    name = "kanagawa",
    opts = {
      colors = {
        theme = {
          all = {
            ui = { bg_gutter = "none" },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
      end,
    },
  },
}
