vim.opt_local.number = true
vim.opt_local.relativenumber = false

-- keymap when harpoon is active
vim.keymap.set("n", "l", require("harpoon.buffer").run_select_command, { noremap = true, buffer = 0 })
