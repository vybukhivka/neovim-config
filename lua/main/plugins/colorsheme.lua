return {
	'rebelot/kanagawa.nvim',
	priority = 1000,
	init = function()
		-- Default options:
		require('kanagawa').setup({
			compile = false,             -- enable compiling the colorscheme
			undercurl = true,            -- enable undercurls
			commentStyle = { italic = false },
			functionStyle = {},
			keywordStyle = { italic = false},
			statementStyle = { bold = true },
			typeStyle = {},
			
			transparent = false,         -- do not set background color
			dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
			terminalColors = true,       -- define vim.g.terminal_color_{0,17}
			colors = {                   -- add/modify theme and palette colors
				palette = {
					waveBlue1 = "#2A2A37";
				},
				theme = { wave = {}, lotus = {}, dragon = {
					ui = { 
						bg_gutter = "#181616",
						float = {
							bg = "#121212",
						},
						pmenu = {
							bg = "#121212",
						},
					},
				}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
		})

		-- setup must be called before loading
		vim.cmd("colorscheme kanagawa-dragon")
	end
}
