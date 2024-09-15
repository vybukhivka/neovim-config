require("main.settings.set")
require("main.settings.remap")
require("main.lazy")

-- Autocomands
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('yank-highlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = 'Highlight on yank',
})

