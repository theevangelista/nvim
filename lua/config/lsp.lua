local servers = {
	"lua_ls",
	"elixirls",
	"jdtls",
	"ts_ls",
	"eslint",
    "powershell_es"
}

local lspconfig = require("lspconfig")
for _, server in ipairs(servers) do
	lspconfig[server].setup({})
end

-- Dart custom config
lspconfig.dartls.setup({
	cmd = { "fvm", "dart", "language-server", "--protocol=lsp" },
})

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

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
        dart = {"fvm dart format"},
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		elixir = { "mix format" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
