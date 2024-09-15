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
							pmenu = {
								bg = "#1f1e1e",
								bg_sel = "#393836",
								bg_thumb = "#282727",
								bg_sbar = "#1D1C19"
							},
							float = {
								bg = "#1a1919",
							}
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

