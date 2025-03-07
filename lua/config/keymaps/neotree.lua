-- File Management
vim.api.nvim_set_keymap("n", "<M-1>", "<cmd>silent! Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle Neotree" })
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>silent! Neotree reveal_file=%:p<CR>", { noremap = true, silent = true, desc = "Toggle Neotree" })
