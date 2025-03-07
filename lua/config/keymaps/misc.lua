vim.keymap.set("n", "<leader>li", ":JumpLastI<CR>", { desc = "Jump to last insert position" })
vim.keymap.set("i", "<C-BS>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>dvb", true, true, true), "n", false)
end, { noremap = true, desc = "Delete the last word, preserving punctuation" })
vim.keymap.set("n", "<leader>jj", ":QuitOthers<CR>", { desc = "Quit all windows but the first opened" })
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Opens lazygit" })
vim.keymap.set("i", "jj", "<ESC>", {desc = "Easy escape from insert mode"})
