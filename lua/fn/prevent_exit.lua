vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local choice = vim.fn.confirm("Exit Neovim?", "&Yes\n&No", 2)
		if choice == 1 then
			vim.cmd("qa")
		end
	end,
})
