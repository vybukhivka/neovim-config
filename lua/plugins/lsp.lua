-- 1. LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
		map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	end,
})

-- 2. Define Servers
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        format = { enable = false },
      },
    },
  },
  clangd = {
    cmd = { 'clangd', '--background-index', '--clang-tidy' },
  },
}
-- 3. Mason Setup
require("mason").setup({})
require("mason-lspconfig").setup({
	automatic_enable = false,
})

local ensure_installed = vim.tbl_keys(servers)
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

-- 4. Native LSP Enable (The new Neovim 0.12+ way)
for name, server in pairs(servers) do
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end
