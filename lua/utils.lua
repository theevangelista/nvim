local M = {}

local ostype = package.config:sub(1, 1) == "\\" and "win" or "unix"
function M.isWindows()
    return ostype == "win"
end

return M
