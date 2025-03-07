local M = {}

function M.require_dir(dir)
    local scan = require("plenary.scandir") -- Requires plenary.nvim
  local files = scan.scan_dir(dir, { depth = 1 })
    print(files)
  for _, file in ipairs(files) do
    if file:match("%.lua$") then
      local module = file:match(".*/(.*)%.lua$")
      local require_path = dir:gsub("/", ".") .. "." .. module
      require(require_path)
    end
  end
end


return M
