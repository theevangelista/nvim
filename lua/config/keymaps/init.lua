vim.g.mapleader = " "
local function req(file)
    require('config/keymaps/' .. file)
end
local files = {
    "buffers",
    "lsp",
    "misc",
    "movements",
    "neotree",
    "tscope",
    "terminal",
    "win",
}

for _, value in ipairs(files) do
   pcall(function() req(value) end)
end
