return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-i>",
				clear_suggestion = "<C-u>",
			}
		})
	end
}
