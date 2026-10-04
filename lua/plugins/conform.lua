require("conform").setup({
	notify_on_error = false,

	default_format_opts = {
		-- Use external formatters if configured below, otherwise use LSP formatting.
		lsp_format = "fallback",
	},

	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		lua = { "stylua" },
	},
})

-- Manual format shortcut (Works in Normal and Visual mode)
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, { desc = "[F]ormat buffer" })
