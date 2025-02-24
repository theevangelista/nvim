-- Keymaps (Mnemonic)
vim.g.mapleader = " "

-- File Management
vim.api.nvim_set_keymap("n", "<leader>fl", ":Oil<CR>", { noremap = true, silent = true, desc = "Open file manager" })

-- Buffers
vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>bp",
	":bprevious<CR>",
	{ noremap = true, silent = true, desc = "Previous Buffer" }
)
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "Delete Buffer" })

-- Windows Management
vim.api.nvim_set_keymap("n", "<leader>ws", ":split<CR>", { noremap = true, silent = true, desc = "Split horizontally" })
vim.api.nvim_set_keymap("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Split vertically" })
vim.api.nvim_set_keymap("n", "<leader>wq", ":q<CR>", { noremap = true, silent = true, desc = "Close Window" })

-- Better Movements
vim.api.nvim_set_keymap("n", "<leader>j", "10j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", "10k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", "$", { noremap = true, silent = true })

-- Harpoon Keybindings
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
vim.keymap.set("n", "<leader>ha", function()
	harpoon_mark.add_file()
end, { desc = "Add file to Harpoon" })
vim.keymap.set("n", "<leader>hm", function()
	harpoon_ui.toggle_quick_menu()
end, { desc = "Toggle Harpoon menu" })
vim.keymap.set("n", "<leader>h1", function()
	harpoon_ui.nav_file(1)
end, { desc = "Go to Harpoon file 1" })
vim.keymap.set("n", "<leader>h2", function()
	harpoon_ui.nav_file(2)
end, { desc = "Go to Harpoon file 2" })
vim.keymap.set("n", "<leader>h3", function()
	harpoon_ui.nav_file(3)
end, { desc = "Go to Harpoon file 3" })
vim.keymap.set("n", "<leader>h4", function()
	harpoon_ui.nav_file(4)
end, { desc = "Go to Harpoon file 4" })
-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, { desc = "Show diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
-- Misc.
vim.keymap.set("n", "<leader>li", ":JumpLastI<CR>", { desc = "Jump to last insert position" })
vim.keymap.set("i", "<C-BS>", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>dvb", true, true, true), "n", false)
end, { noremap = true, desc = "Delete the last word, preserving punctuation" })
vim.keymap.set("n", "<leader>jj", ":QuitOthers<CR>", { desc = "Quit all windows but the first opened" })
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Opens lazygit" })
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find document symbols" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find word under cursor" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find commands" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Find marks" })
