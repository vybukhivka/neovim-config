return {
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    },
  config = function()
    require("chatgpt").setup({
			api_key_cmd = "secret-tool lookup openai neovim",
			openai_params = {
				model = "gpt-3.5-turbo",
				max_tokens = 666
			},
			chat = {
				border_left_sign = '',
				border_right_sign = '',
			}
    })
  end
}
