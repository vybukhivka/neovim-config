return {
	'rebelot/kanagawa.nvim',
	priority = 1000,
	config = function()
		require('kanagawa').setup({
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
							bg_p2 = "#1f1c1c",
							bg_dim = "#1f1e1e",
							pmenu = {
								bg = "#1b1818",
								bg_sel = "#393836",
								bg_thumb = "#282727",
								bg_sbar = "#1D1C19"
							},
							float = {
								bg = "#1a1919",
							}
						},
						syn = {
							string = "#4b8b8b",
							constant = "#f4ecec",
							number = "#b4593b",
							identifier = "#ca4848",
							fun = "#a06d3a",
							statement = "#ca4848",
							operator = "#6f6fc5",
							preproc = "#7272ca",
							type = "#a06d3a",
							regex = "#4b8b8b",
							deprecated = "#00ff00",
							punct = "#6e6767",
							special1 = "#7272ca",
							special2 = "#f4ecec",
							special3 = "#7272ca",
							-- type = "#00ff00",
							-- operator = "#56548b"
						}
					}
				}
			}
		})
	end,
	init = function()
		vim.cmd 'colorscheme kanagawa-dragon'
	end
}

