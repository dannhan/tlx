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
