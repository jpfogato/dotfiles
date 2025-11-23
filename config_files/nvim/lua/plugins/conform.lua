-- used to manage code formatters between different plugins

return {
	"stevearc/conform.nvim",
	opts = {
		-- configure the supported languages
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			json = { "prettier" },
			python = { "autopep8" },
		},
		-- configure autoformat when file save
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
