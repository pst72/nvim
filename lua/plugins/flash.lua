local function gh(repo)
	return "https://github.com/" .. repo
end

-- Useful plugin to show you pending keybinds.
vim.pack.add({ gh("folke/flash.nvim") })
require("flash").setup({

	-- opts = {
	modes = {
		char = {
			jump_labels = true,
		},
	},
	label = {
		rainbow = {
			enabled = true,
			shade = 6,
		},
	},
	remote_op = {
		restore = true,
		-- For `jump.pos = "range"`, this setting is ignored.
		-- `true`: always enter a new motion when doing a remote operation
		-- `false`: use the window's cursor position and jump target
		-- `nil`: act as `true` for remote windows, `false` for the current window
		motion = nil,
	},
	-- },
  -- stylua: ignore
    enabled = true,
})

-- vim.keymap.set({"n", "x", "o"}, "*", function()
--   require("flash").jump({
--     pattern = vim.fn.expand("<cword>")
-- })
-- end, { desc = "Word under Cursor" })

vim.keymap.set({ "n", "x", "o" }, "<localleader>s", function()
	require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set({ "o" }, "r", function()
	require("flash").remote()
end, { desc = "Remote Flash " })

vim.keymap.set({ "x", "o" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Flash Treesitter Search" })

vim.keymap.set({ "c" }, "<C-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })
