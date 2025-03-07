local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")
local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local defaultTheme = "dropdown";
local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job:new({
        command = "file",
        args = { "--mime-type", "-b", filepath },
        on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]
            if mime_type == "text" then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
                -- maybe we want to write something to the buffer here
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                end)
            end
        end
    }):sync()
end
require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["<M-p>"] = actions_layout.toggle_preview
            },
            i = {
                ["<ESC>"] = actions.close,
                ["<M-p>"] = actions_layout.toggle_preview
            }
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim"
        },
        preview = {
            filesize_limit = 0.1 -- 1mb
        },
        buffer_previewer_maker = new_maker,
    },
    pickers = {
        find_files = {
            theme = defaultTheme,
        },
        grep_string = {
            theme = defaultTheme,
        },
        oldfiles = {
            theme = defaultTheme,
        },
        live_grep = {
            theme = defaultTheme
        },
        lsp_definitions = {
            theme = defaultTheme,
        },
        lsp_references = {
            theme = defaultTheme,
        },
        lsp_implementations = {
            theme = defaultTheme,
        },
        buffers = {
            theme = defaultTheme,
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                }
            }
        }
    }
})
require("telescope").load_extension("ui-select")
