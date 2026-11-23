vim.pack.add({
	"https://github.com/mrcjkb/rustaceanvim",
	"https://github.com/nwiizo/cargo.nvim",
	"https://github.com/Saecki/crates.nvim",
})

vim.g.rustaceanvim = function()
	local capabilities = {}
	local ok, blink = pcall(require, "blink.cmp")
	if ok then
		capabilities = blink.get_lsp_capabilities()
	end

	return {
		tools = {
			hover_actions = {
				auto_focus = true,
			},
		},
		server = {
			capabilities = capabilities,
			default_settings = {
				["rust-analyzer"] = {
					hover = {
						actions = {
							enable = true,
							references = { enable = true },
						},
						documentation = {
							enable = true,
							keywords = { enable = true },
						},
					},
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					cargo = {
						allFeatures = true,
						loadOutDirsFromCheck = true,
						runBuildScripts = true,
					},
					procMacro = {
						enable = true,
						ignored = {},
					},
					checkOnSave = true,
					check = {
						command = "clippy",
						extraArgs = { "--no-deps" },
					},
				},
			},
		},
	}
end

require("cargo").setup({})

vim.keymap.set("n", "<leader>cb", "<cmd>Cargo build<cr>", { desc = "Cargo Build" })
vim.keymap.set("n", "<leader>cr", "<cmd>Cargo run<cr>", { desc = "Cargo Run" })
vim.keymap.set("n", "<leader>ct", "<cmd>Cargo test<cr>", { desc = "Cargo Test" })
vim.keymap.set("n", "<leader>cc", "<cmd>Cargo check<cr>", { desc = "Cargo Check" })
vim.keymap.set("n", "<leader>cd", "<cmd>Cargo doc<cr>", { desc = "Cargo Doc" })

require("crates").setup()

local augroup = vim.api.nvim_create_augroup("RustLsp", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup,
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client.name == "rust-analyzer" then
			vim.keymap.set("n", "K", function()
				vim.cmd.RustLsp({ "hover", "actions" })
			end, { silent = true, buffer = ev.buf, desc = "RustLsp hover actions" })
		end
	end,
})
