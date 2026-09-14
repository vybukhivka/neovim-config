return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ensure_installed = {
			"bash",
			"c",
			"cpp",
			"diff",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		}

		local ts = require("nvim-treesitter")
		if ts.install then
			ts.install(ensure_installed)
		end

		-- Filetypes that must never get treesitter
		local skip = {
			TelescopePrompt = true,
			TelescopeResults = true,
			TelescopePreview = true,
				["neo-tree"] = true,
				["neo-tree-popup"] = true,
			notify = true,
			nofile = true,
			prompt = true,
			qf = true,
			help = true,
			man = true,
			checkhealth = true,
			lazy = true,
			mason = true,
			oil = true,
			alpha = true,
			dashboard = true,
		}

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local buf = args.buf
				local ft = vim.bo[buf].filetype

				-- 1. Skip empty / known UI filetypes
				if ft == "" or skip[ft] then
					return
				end

				-- 2. Skip non-normal buffers (prompts, terminals, etc.)
				if vim.bo[buf].buftype ~= "" then
					return
				end

				-- 3. Resolve language
				local lang = vim.treesitter.language.get_lang(ft)
				if not lang then
					return
				end

				-- 4. Only start if parser really exists
				local ok_add = pcall(vim.treesitter.language.add, lang)
				if not ok_add then
					return
				end

				-- 5. Safe start
				pcall(vim.treesitter.start, buf, lang)

				-- Indent (optional)
				if ft ~= "c" and ft ~= "cpp" then
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
