--------------------------------- options -----------------------------------------
vim.o.laststatus = 3 -- global statusline

vim.o.clipboard = "unnamed,unnamedplus" -- copy-paste outside vim
vim.o.cursorline = true -- highlight current line

-- Indenting
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2

-- Numbers
vim.o.number = true
vim.o.relativenumber = true
-- vim.o.numberwidth = 2
vim.o.ruler = false

vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.pumheight = 10
vim.o.scrolloff = 8
vim.o.wrap = false

vim.o.swapfile = false
vim.o.undofile = true
vim.o.encoding = "utf-8"

vim.o.completeopt = "menu,menuone,noselect"
vim.o.wildignore = "*node_modules/**"
vim.o.pumheight = 10

-- Better Search
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

-- make EndOfBuffer invisible
vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
  lastline = " ",
}

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")
