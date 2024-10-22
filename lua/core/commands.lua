-- Store the path of the bufferline state file
-- TODO: use json instead
local bufferline_state_file = vim.fn.stdpath("data") .. "/bufferline_state.txt"

-- Function to load the bufferline state
local function load_bufferline_state()
  local state = vim.fn.filereadable(bufferline_state_file) == 1 and vim.fn.readfile(bufferline_state_file)[1] or "true"
  return state == "true"
end

-- Function to save the bufferline state
local function save_bufferline_state(state)
  vim.fn.writefile({ tostring(state) }, bufferline_state_file)
end

-- Initialize bufferline state
vim.g.bufferline_active = load_bufferline_state()

-- Apply initial state
vim.opt.showtabline = vim.g.bufferline_active and 2 or 0

-- Function to toggle bufferline
function ToggleBufferline()
  vim.g.bufferline_active = not vim.g.bufferline_active
  vim.opt.showtabline = vim.g.bufferline_active and 2 or 0
  save_bufferline_state(vim.g.bufferline_active)
  print(vim.g.bufferline_active and "Bufferline enabled" or "Bufferline disabled")
end

-- Optional: Create a command to toggle bufferline
vim.api.nvim_create_user_command("ToggleBufferline", ToggleBufferline, {})
