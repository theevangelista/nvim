function split_with_terminal()
	if #vim.api.nvim_list_wins() > 1 then
		vim.cmd("QuitOthers") -- remove all windows
	end
	vim.cmd("split") -- Split horizontally for terminal
	vim.cmd("wincmd j") -- Move to terminal
	vim.cmd("terminal") -- Open terminal
end
vim.api.nvim_create_user_command("SplitTerm", split_with_terminal, {})

function split_with_terminal_and_debugger()
	if #vim.api.nvim_list_wins() > 1 then
		vim.cmd("QuitOthers")
	end
	vim.cmd("split") -- Debugger split
	vim.cmd("wincmd j") -- Move to debugger split
	vim.cmd("vsplit")
	vim.cmd("wincmd h")
	vim.cmd("lua require'dapui'.toggle()")
	vim.cmd("wincmd l") -- Move back to editor window
	vim.cmd("terminal")
	vim.cmd("wincmd k")
end
vim.api.nvim_create_user_command("SplitDebug", split_with_terminal_and_debugger, {})

function hide_all_but_main()
	local cur_win = vim.api.nvim_get_current_win()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
		if win ~= cur_win and buftype == "" then
			vim.api.nvim_win_close(win, false)
		end
	end
end
vim.api.nvim_create_user_command("HideOthers", hide_all_but_main, {})
