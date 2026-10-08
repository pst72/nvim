local function gh(repo)
	return "https://github.com/" .. repo
end

vim.pack.add({ gh("catgoose/nvim-colorizer.lua") })

vim.cmd([[set termguicolors]])

require("colorizer").setup({
	options = {
		parsers = {
			css = true, -- preset: enables names, hex, rgb, hsl, oklch, css_var
			tailwind = { enable = true },
			-- xterm = true,
		},
		display = {
			mode = "background", -- ("background"|"foreground"|"virtualtext")
			virtualtext = { position = "after" },
		},
	},
})

require("colorizer")
vim.keymap.set("n", "\\c", "<cmd>ColorizerToggle<CR>", { desc = "Toggle colorizer" })
