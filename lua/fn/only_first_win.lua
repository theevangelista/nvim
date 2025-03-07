vim.api.nvim_create_user_command("QuitOthers", function()
  local first_win = vim.api.nvim_list_wins()[1] -- Get the first window
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if win ~= first_win then
      vim.api.nvim_win_close(win, false) -- Close other windows
    end
  end
end, {})

