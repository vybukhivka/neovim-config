-- Helper function to run build commands
local function run_build(name, cmd, cwd)
	local result = vim.system(cmd, { cwd = cwd }):wait()
	if result.code ~= 0 then
		local stderr = result.stderr or ""
		local stdout = result.stdout or ""
		local output = stderr ~= "" and stderr or stdout
		if output == "" then
			output = "No output from build command."
		end
		vim.notify(("Build failed for %s:\n%s"):format(name, output), vim.log.levels.ERROR)
	end
end

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind
		if kind ~= "install" and kind ~= "update" then
			return
		end

		-- 1. Build Telescope FZF
		if name == "telescope-fzf-native.nvim" and vim.fn.executable("make") == 1 then
			run_build(name, { "make" }, ev.data.path)
			return
		end

		-- 2. Build LuaSnip (adds advanced jsregexp support)
		if name == "LuaSnip" then
			if vim.fn.has("win32") ~= 1 and vim.fn.executable("make") == 1 then
				run_build(name, { "make", "install_jsregexp" }, ev.data.path)
			end
			return
		end

		-- 3. Update Treesitter Parsers
		if name == "nvim-treesitter" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
			return
		end
	end,
})

vim.pack.add({
	-- Snippets & Completion
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	{ src = "https://github.com/saghen/blink.lib" },

	-- LSP & Mason
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },

	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

	-- Mini (UI and editing enhancements)
	{ src = "https://github.com/nvim-mini/mini.nvim" },

	-- Telescope & dependencies
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },

	-- Formatting
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Git
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/kdheepak/lazygit.nvim" },

	-- Colorscheme
	{ src = "https://github.com/ficd0/ashen.nvim" },
})

require("plugins.blink")
require("plugins.lsp")
require("plugins.treesitter")
require("plugins.mini")
require("plugins.telescope")
require("plugins.conform")
require("plugins.git")
require("fidget").setup({})
require("nvim-autopairs").setup({
	check_ts = true,
})

vim.cmd.colorscheme("ashen")
