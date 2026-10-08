local function gh(repo)
	return "https://github.com/" .. repo
end

-- A number of different themes to choose from

vim.pack.add({ gh("folke/tokyonight.nvim") })
-- require("tokyonight").setup()
vim.cmd([[colorscheme tokyonight-night]])
-- 	-- vim.cmd[[colorscheme tokyonight-storm]]
-- 	-- vim.cmd[[colorscheme tokyonight-moon]]

-- vim.pack.add({ gh("catppuccin/nvim") })
-- vim.cmd([[colorscheme catppuccin-mocha]])
-- -- 	-- vim.cmd[[colorscheme catppuccin-macchiato]]
-- -- 	-- vim.cmd[[colorscheme catppuccin-frappe]]
