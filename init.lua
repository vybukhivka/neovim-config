-- Explicitly force Neovim to use terminal OSC 52 for clipboard
-- This blocks wl-copy from spawning dummy windows that break Pop Shell tiling
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		-- Use the Visual group and a strict 200ms timeout
		vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

require("options")
require("keymaps")
require("plugins")
