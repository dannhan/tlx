vim.opt_local.number = false
vim.opt_local.relativenumber = false

vim.keymap.set("n", "l", require("harpoon.buffer").run_select_command, { noremap = true, buffer = 0 })
