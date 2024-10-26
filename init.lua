require("core")
require("plugins")

-- persisted colorscheme
local color_state_file = vim.fn.stdpath("data") .. "/color_state"
local ok, color_data = pcall(vim.fn.readfile, color_state_file)
if ok and color_data[1] and color_data[1] ~= "" then
  vim.cmd.colorscheme(color_data[1])
end
