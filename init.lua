-- Install lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP and Autocompletion
    {
        "nvim-java/nvim-java",
        lazy = true,
        config = function()
            require("java").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "elixirls", "jdtls", "ts_ls", "eslint" },
        },
    },
    { "williamboman/mason.nvim",  config = true },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/nvim-cmp",         config = true },
    { "hrsh7th/cmp-nvim-lsp",     config = true },
    { "L3MON4D3/LuaSnip",         config = true },
    { "saadparwaiz1/cmp_luasnip" },
    { "stevearc/conform.nvim" },
    -- Syntax & Treesitter
    { "elixir-editors/vim-elixir" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "http",
                "elixir",
                "typescript",
                "javascript",
                "html",
                "java",
                "sql",
                "dart",
                "powershell",
                "python",
            },
        },
    },

    -- Pickers
    { "nvim-telescope/telescope.nvim",          dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- UI & Focus Enhancements
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "auto",
                background = {
                    light = "latte",
                    dark = "frappe",
                },
                transparent_background = true,
                no_italic = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    treesitter = true,
                    notify = true,
                    mason = true,
                    neotree = true,
                    copilot_vim = true,
                    gitgutter = true,

                }
            })
            vim.cmd("colorscheme catppuccin")
        end,
    },
    -- {
    --     'projekt0n/github-nvim-theme',
    --     name = 'github-theme',
    --     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         require('github-theme').setup({
    --             options = {
    --                 transparent = true,
    --                 dim_inactive = true,
    --             }
    --
    --         })
    --
    --         vim.cmd('colorscheme github_dark_default')
    --         vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
    --         vim.api.nvim_set_hl(0, "NormalNC", { guibg = NONE, ctermbg = NONE })
    --
    --         vim.api.nvim_set_hl(0, "NeoTreeNormal", { guibg = NONE, ctermbg = NONE })
    --         vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { guibg = NONE, ctermbg = NONE })
    --         vim.api.nvim_set_hl(0, "NeoTreeTabActive", { guibg = NONE, ctermbg = NONE })
    --         vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { guibg = NONE, ctermbg = NONE })
    --         vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { guibg = NONE, ctermbg = NONE, ctermfg = NONE })
    --         vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { guibg = NONE, ctermbg = NONE, ctermfg = NONE })
    --         vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { guibg = NONE, ctermbg = NONE, ctermfg = NONE })
    --         vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { guibg = NONE, ctermbg = NONE, ctermfg = NONE })
    --         vim.api.nvim_set_hl(0, "CursorLine", { guibg = underline, ctermbg = NONE, ctermfg = NONE })
    --     end,
    -- },
    { "folke/zen-mode.nvim",   lazy = true },
    {
        "folke/noice.nvim",
        lazy = true,
        dependencies = { "MunifTanjim/nui.nvim" }
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            theme = "catppuccin"
        }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },

    -- Debugging
    { "mfussenegger/nvim-dap", lazy = true, config = true },
    { "rcarriga/nvim-dap-ui",  lazy = true, config = true, dependencies = { "mfussenegger/nvim-dap" } },
    {
        "jay-babu/mason-nvim-dap.nvim",
        lazy = true,
        dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    },
    { "theHamsta/nvim-dap-virtual-text", lazy = true, config = true },

    -- Surround & Comments
    -- :h nvim-surround.usage
    { "kylechui/nvim-surround",          lazy = true, config = true },
    { "numToStr/Comment.nvim",           lazy = true, config = true },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
    },
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            'nvimtools/hydra.nvim',
        },
        opts = {},
        cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
        keys = {
            {
                mode = { 'v', 'n' },
                '<Leader>m',
                '<cmd>MCstart<cr>',
                desc = 'Create a selection for selected text or word under the cursor',
            },
        },
    },
    -- Git Integration
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim", config = true },
    -- Project Management
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                detection_methods = { "lsp", "pattern" },
                patterns = { ".git", "Makefile", "package.json", "mix.exs" },
            })
            require("telescope").load_extension("projects")
        end,
    },

})
require("fn/auto_save")
require("fn/last_edit_location")
require("fn/warn_on_last_window")
require("config/cmds")
require("config/opt")
require("config/lsp")
require("config/telescope")
require("config/keymaps")
require("config/neotree")
require("config/splits")
require("fn/prevent_exit")
require("fn/only_first_win")
require("fn/swap_lines")
require("fn/toggle_case")
