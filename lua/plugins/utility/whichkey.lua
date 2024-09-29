return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 700
    local wk = require("which-key")
    wk.setup({})
    wk.register({
      s = {
        name = "+Search",
        s = { "<cmd> Telescope builtin<CR>", "[S]earch [S]elect Telescope" },
        f = { "<cmd> Telescope find_files<CR>", "[S]earch [F]iles" },
        h = { "<cmd> Telescope help_tags<CR>", "[S]earch [H]elp" },
        w = { "<cmd> Telescope grep_string<CR>", "[S]earch current [W]ord" },
        g = { "<cmd> Telescope live_grep<CR>", "[S]earch by [G]rep" },
        d = { "<cmd> Telescope diagnostics<CR>", "[S]earch [D]iagnostics" },
        r = { "<cmd> Telescope resume<CR>", "[S]earch [R]esume" },
        t = { "<cmd> Telescope colorscheme<CR>", "[S]earch [T]hemes" },
      },
      h = {
        name = "+Harpoon",
        a = { "", "[H]arpoon [A]ppend" },
        s = { "", "[H]arpoon First Item" },
        d = { "", "[H]arpoon Second Item" },
        f = { "", "[H]arpoon Third Item" },
        g = { "", "[H]arpoon Fourth Item" },
      },
    }, { prefix = "<leader>" })
  end,
}
