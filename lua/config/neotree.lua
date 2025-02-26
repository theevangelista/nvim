local neotree = require("neo-tree")

neotree.setup({
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
