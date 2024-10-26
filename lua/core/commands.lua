-- TODO: is it possible to use json or somtething?

-- get the value of initial showtabline state state
local showtabline_state_file = vim.fn.stdpath("data") .. "/showtabline_state"
local ok, showtabline_data = pcall(vim.fn.readfile, showtabline_state_file)
if ok and showtabline_data[1] and showtabline_data[1] ~= "" then
  vim.o.showtabline = showtabline_data[1] == "2" and 2 or 0
end

-- user command for toggle the bufferline
vim.api.nvim_create_user_command("ToggleBufferline", function()
  vim.o.showtabline = vim.o.showtabline == 2 and 0 or 2
  vim.fn.writefile({ vim.o.showtabline }, showtabline_state_file)

  if vim.o.showtabline == 2 then
    require("bufferline")
  end
end, {})
