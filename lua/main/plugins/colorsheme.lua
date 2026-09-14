return {
	"skylarmb/torchlight.nvim",
	name = "torchlight",
	priority = 1000,
	init = function()
		vim.opt.termguicolors = true

		vim.cmd.colorscheme("torchlight-dusk")

		vim.cmd([[
		  highlight LineNr guibg=NONE
		  highlight CursorLineNr guibg=NONE
		  highlight SignColumn guibg=NONE
	]])
	end,
}
