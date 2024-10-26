-- Highlight for colors (rgb, hsl, hex, tailwind, etc..)
return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      enable_tailwind = true,
      render = "virtual",
      virtual_symbol_suffix = " ",
      virtual_symbol = "󱓻",
    },
  },
}
