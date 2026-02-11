return {
	'fcpg/vim-fahrenheit',
	priority = 1000,
	init = function()
		-- setup must be called before loading
		vim.opt.termguicolors = true

		vim.cmd 'colorscheme fahrenheit'
		vim.cmd [[
			highlight Visual guibg=#282422 guifg=NONE
			]]
		vim.cmd [[
			highlight CursorLine guibg=#111111 guifg=NONE
			]]


	end
}
