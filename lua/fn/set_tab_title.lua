local wezterm = require("wezterm")
local function get_filename()
   local filename = vim.fn.expand("%:t") 
   return 'nvim - ' .. filename
end

local function set_tab_filename()
    wezterm.set_tab_title(get_filename())
end

vim.api.nvim_create_autocmd("BufEnter", {
    callback = set_tab_filename
})
