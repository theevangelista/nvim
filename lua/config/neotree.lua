local neotree = require("neo-tree")

neotree.setup({
    event_handlers = {

        {
            event = "file_open_requested",
            handler = function()
                -- auto close
                -- vim.cmd("Neotree close")
                -- OR
                require("neo-tree.command").execute({ action = "close" })
            end
        },

    },
    default_component_configs = {
        icon = {
            enabled = false
        },
        git_status = {
            symbols = {
                -- Change type
                added     = "+",
                deleted   = "x",
                modified  = "~",
                renamed   = "~|",
                -- Status type
                untracked = "?",
                ignored   = "i",
                unstaged  = "u",
                staged    = "s",
                conflict  = "c",
            }
        },
        diagnostics = {
            symbols = {
                hint = "(h)",
                info = "(i)",
                warn = "(!)",
                error = "(x)",
            },
        }
    }
})
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
