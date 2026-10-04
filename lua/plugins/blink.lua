require("luasnip").setup({})
require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
	keymap = { 
        preset = "default",

        -- Scroll the documentation window popup
        ["<C-f>"] = { "scroll_documentation_up" },
        ["<C-b>"] = { "scroll_documentation_down" },
    },

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 0 },
	},

	sources = {
		default = { "lsp", "path", "snippets" },
	},

	snippets = { preset = "luasnip" },

	fuzzy = { implementation = "lua" },

	signature = {
		enabled = true,
	},
})
