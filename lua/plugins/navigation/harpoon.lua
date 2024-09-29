return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  branch = "harpoon2",
  keys = {
    {
      "<C-h>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
    },
    {
      "<leader>ho",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
    },
    { "<leader>ha", function() require("harpoon"):list():append() end },
    { "<leader>hs", function() require("harpoon"):list():select(1) end },
    { "<leader>hd", function() require("harpoon"):list():select(2) end },
    { "<leader>hf", function() require("harpoon"):list():select(3) end },
    { "<leader>hg", function() require("harpoon"):list():select(4) end },
  },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
}
