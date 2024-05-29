return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"bashls",
					"tsserver",
					"jdtls",
					"rust_analyzer",
					-- "clangd",
					-- "cssls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local config = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

			config.lua_ls.setup({ capabilities = capabilities })
			config.tsserver.setup({ capabilities = capabilities })
			config.bashls.setup({ capabilities = capabilities })
			config.jdtls.setup({ capabilities = capabilities })
			config.rust_analyzer.setup({ capabilities = capabilities })

			local dartExcludedFolders = {
				vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("/opt/homebrew/"),
				vim.fn.expand("$HOME/development/flutter/bin/flutter"),
			}

			config["dartls"].setup({
				capabilities = capabilities,
				cmd = {
					"dart",
					"language-server",
					"--protocol=lsp",
					-- "--port=8123",
					-- "--instrumentation-log-file=/Users/robertbrunhage/Desktop/lsp-log.txt",
				},
				filetypes = { "dart" },
				init_options = {
					onlyAnalyzeProjectsWithOpenFiles = false,
					suggestFromUnimportedLibraries = true,
					closingLabels = true,
					outline = false,
					flutterOutline = false,
				},
				settings = {
					dart = {
						analysisExcludedFolders = dartExcludedFolders,
						updateImportsOnRename = true,
						completeFunctionCalls = true,
						showTodos = true,
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<A-S-enter>", vim.lsp.buf.code_action, {})
		end,
	},
}
