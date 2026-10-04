-- If you need options, use vim.g.opencode_opts = { ... } instead of setup()
vim.g.opencode_opts = {
    -- Recommended keymaps for opencode.nvim
    vim.keymap.set({ "n", "x" }, "<C-a>", function()
        require("opencode").ask("@this: ")
    end, { desc = "Ask OpenCode…" }),
}

