vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
vim.api.nvim_set_keymap(
    "n",
    "<leader>bp",
    ":bprevious<CR>",
    { noremap = true, silent = true, desc = "Previous Buffer" }
)
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "Delete Buffer" })


