-- TODO: harpoon with telescope
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  -- stylua: ignore
  keys = {
    { "<C-h>",      function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Quick Menu" },
    { "<leader>ha", function() require("harpoon"):list():add() end,                                    desc = "[H]arpoon [A]ppend" },
    { "<leader>h1", function() require("harpoon"):list():select(1) end,                                desc = "[H]arpoon First Item" },
    { "<leader>h2", function() require("harpoon"):list():select(2) end,                                desc = "[H]arpoon Second Item" },
    { "<leader>h3", function() require("harpoon"):list():select(3) end,                                desc = "[H]arpoon Third Item" },
    { "<leader>h4", function() require("harpoon"):list():select(4) end,                                desc = "[H]arpoon Fourth Item" },
  },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
}
