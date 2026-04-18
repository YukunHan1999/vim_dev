require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require('mason-lspconfig').setup({ 
	ensure_installed = { 
		"lua_ls",
        "rust_analyzer",
	},
	automatic_installation = true,
})

vim.lsp.config("lua_ls", {})
vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
            check = { command = "clippy" },
        },
    },
})
