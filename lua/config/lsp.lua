local utils = require("utils")
local home = os.getenv("HOME")
if (utils.isWindows()) then
    local servers = {
        "lua_ls",
        "elixirls",
        "jdtls",
        "ts_ls",
        "eslint",
        "powershell_es",
        "pyright"
    }
    local lspconfig = require("lspconfig")
    for _, server in ipairs(servers) do
        lspconfig[server].setup({})
    end
    lspconfig.dartls.setup {
        cmd = { "fvm", "dart", "language-server", "--protocol=lsp" }
    }
else
    local servers = {
        "lua_ls",
        "ts_ls",
        "eslint",
        "pyright",
    }
    local lspconfig = require("lspconfig")
    for _, server in ipairs(servers) do
        lspconfig[server].setup({})
    end
    lspconfig.elixirls.setup({
        cmd = { home .. "/.local/lsp/elixirls/language_server.sh" }
    })
end

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
    }),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        vim.lsp.buf.format()
    end,
})
