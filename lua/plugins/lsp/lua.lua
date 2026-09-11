vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
	-- Optional: Format automatically on save
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
