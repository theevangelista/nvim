local save_timer = nil
local save_delay = 2000 -- Delay in milliseconds (2 seconds)

-- Function to save the buffer after a delay
local function delayed_save()
	if save_timer then
		save_timer:stop()
	end

	save_timer = vim.defer_fn(function()
		if vim.bo.modified then
			vim.cmd("silent! write")
			vim.cmd("echo 'Saved.'")
		end
	end, save_delay)
end

-- Function to save immediately when leaving insert mode
local function immediate_save()
	if vim.bo.modified then
		vim.cmd("silent! write")
		vim.cmd("echo 'Saved.'")
	end
end

-- Autocommands to trigger save
vim.api.nvim_create_autocmd("InsertLeave", { callback = immediate_save })
vim.api.nvim_create_autocmd("TextChanged", { callback = delayed_save }) -- Trigger save delay on insert mode edits
-- vim.api.nvim_create_autocmd("TextChangedI", { callback = delayed_save })  -- Trigger save delay on insert mode edits
vim.api.nvim_create_autocmd("BufLeave", { callback = immediate_save }) -- Save when switching buffers
