-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Persisted colorscheme
local color_state_file = vim.fn.stdpath("data") .. "/color_state"
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    -- save colorscheme state
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.fn.writefile({ vim.fn.expand("<amatch>") }, color_state_file)
      end,
    })
  end,
})

-- An issue for luasnip: 'https://github.com/L3MON4D3/LuaSnip/issues/258'
local ok, luasnip = pcall(require, "luasnip")
if not ok then
  return
end
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    if
      ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
      and not luasnip.session.jump_active
    then
      luasnip.unlink_current()
    end
  end,
})
