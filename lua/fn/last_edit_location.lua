local insert_positions = {}
local max_positions = 10  -- Change this to store more/less positions

-- Function to store the last insert position
local function store_insert_position()
  local pos = vim.api.nvim_win_get_cursor(0)
  local buf = vim.api.nvim_get_current_buf()
  table.insert(insert_positions, {buf = buf, pos = pos})

  -- Keep the list within the max size
  if #insert_positions > max_positions then
    table.remove(insert_positions, 1)
  end
end

-- Function to jump to the last insert position
local function jump_to_last_insert()
  if #insert_positions == 0 then
    print("No insert positions recorded")
    return
  end

  local last = table.remove(insert_positions)
  if vim.api.nvim_buf_is_valid(last.buf) then
    vim.api.nvim_set_current_buf(last.buf)
    vim.api.nvim_win_set_cursor(0, last.pos)
  end
end

-- Autocommand to track insert position
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = store_insert_position
})

vim.api.nvim_create_user_command("JumpLastI", jump_to_last_insert, {})
