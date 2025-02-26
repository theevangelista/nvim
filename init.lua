-- Install lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "dstein64/vim-startuptime" },
    -- LSP and Autocompletion
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = true },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "elixirls", "jdtls", "ts_ls", "eslint" },
        },
    },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/nvim-cmp",        config = true },
    { "hrsh7th/cmp-nvim-lsp",    config = true },
    { "L3MON4D3/LuaSnip",        config = true },
    { "saadparwaiz1/cmp_luasnip" },
    { "stevearc/conform.nvim" },
    -- Syntax & Treesitter
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
            },
        },
    },

    -- Pickers
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- UI & Focus Enhancements
    {
        "Mofiqul/dracula.nvim",
        config = function()
            vim.cmd("colorscheme dracula")
        end
    },
    { "folke/zen-mode.nvim",           lazy = true },
    { "folke/noice.nvim",              lazy = true,                               dependencies = { "MunifTanjim/nui.nvim" } },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "dracula-nvim"
            }
        }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },

    -- Debugging
    { "mfussenegger/nvim-dap", lazy = true },
    { "rcarriga/nvim-dap-ui",  lazy = true, dependencies = { "mfussenegger/nvim-dap" } },
    {
        "jay-babu/mason-nvim-dap.nvim",
        lazy = true,
        dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    },

    -- Surround & Comments
    -- :h nvim-surround.usage
    { "kylechui/nvim-surround", lazy = true, config = true },
    { "numToStr/Comment.nvim",  lazy = true, config = true },
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
    -- Navigation and Marking
    { "ThePrimeagen/harpoon",    lazy = true },

    -- Git Integration
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

    -- Persistent Sessions
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                auto_restore_enabled = true,
                auto_save_enabled = true,
            })
        end,
    },
    -- Terminal integration
    {
        'willothy/wezterm.nvim',
        config = true
    },
})
require("fn/auto_save")
require("fn/last_edit_location")
require("fn/warn_on_last_window")
require("config/cmds")
require("config/opt")
require("config/lsp")
require("config/keybinds")
require("config/neotree")
require("config/splits")
require("fn/prevent_exit")
require("fn/only_first_win")
require("fn/only_first_win")
require("fn/set_tab_title")
