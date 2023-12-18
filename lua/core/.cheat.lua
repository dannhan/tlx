--------------------- Just a docs for some things to remember ---------------------

-- autocmd filetype conditional
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "*" },
	callback = function()
		if vim.bo.filetype ~= "lir" then
			print(vim.bo.filetype)
		end
	end,
})

-- fizzBuzz
for i = 1, 33, 1 do
	local output = ""
	if i % 3 == 0 then
		output = "Fizz"
	end
	if i % 5 == 0 then
		output = output .. "Buzz"
	end
  if output == "" then
    print(i)
  else
    print(output)
  end
end

function serializeTable(val, name, skipnewlines, depth)
  skipnewlines = skipnewlines or true
  depth = depth or 0

  local tmp = string.rep(" ", depth)

  if name then
    tmp = tmp .. name .. " = "
  end

  if type(val) == "table" then
    tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

    for k, v in pairs(val) do
      tmp = tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
    end

    tmp = tmp .. string.rep(" ", depth) .. "}"
  elseif type(val) == "number" then
    tmp = tmp .. tostring(val)
  elseif type(val) == "string" then
    tmp = tmp .. string.format("%q", val)
  elseif type(val) == "boolean" then
    tmp = tmp .. (val and "true" or "false")
  else
    tmp = tmp .. '"[inserializeable datatype:' .. type(val) .. ']"'
  end

  return tmp
end

