vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim", name = "mason" },
})
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
		"gopls",
		"lua_ls"
	},
	automatic_installation = true,
})