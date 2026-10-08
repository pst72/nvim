local function gh(repo)
	return "https://github.com/" .. repo
end

-- Useful plugin to show you pending keybinds.
vim.pack.add({ gh("folke/which-key.nvim") })

require("which-key").setup({
	spec = {
		{ "<leader>f", group = " Find" }, -- group
		{ "<leader>n", group = " Noice" }, -- group
		{ "<leader>m", group = " Markdown", icon = "" }, -- group
		{ "<leader>s", group = " Search" }, -- group
		{ "<leader>g", group = " Git", icon = "" }, -- group
		{ "<leader>gh", group = " Hunk" }, -- group
		{ "<leader>gt", group = " Toggle" }, -- group
		{ "<leader>l", group = " Lsp" }, -- group
		{ "<leader>d", group = " Document" }, -- group
		{ "<leader>t", group = " Terminal" }, -- group
		{ "<leader>u", group = " UI" }, -- group
		{ "<leader>?", group = " Tips" }, -- group
		{ "<localleader>x", group = " Trouble" }, -- group
		{ "<localleader>l", group = " Lazy" }, -- group
	},
	preset = "classic", -- 'classic','modern','helix'
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
})
