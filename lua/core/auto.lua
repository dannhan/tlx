vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local path = "/home/anibaw/.config/nvim/init.lua"
    local text = 'vim.cmd.colorscheme("' .. vim.g.colors_name .. '")'
    local lines = vim.fn.readfile(path)

    table.remove(lines, #lines)
    vim.fn.writefile(lines, path)

    table.insert(lines, text)
    vim.fn.writefile(lines, path)
  end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    if
      ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})
