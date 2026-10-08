local function gh(repo)
	return "https://github.com/" .. repo
end

-- Useful plugins
vim.pack.add({ gh("nvim-mini/mini.nvim") })

require("mini.ai").setup()
require("mini.statusline").setup()
require("mini.pairs").setup({
	mappings = {
		["<"] = { action = "open", pair = "<>", neigh_pattern = "^[^\\]" },
		[">"] = { action = "close", pair = "<>", neigh_pattern = "^[^\\]" },
	},
})
require("mini.bracketed").setup({
	buffer = { suffix = "b", options = {} },
	comment = { suffix = "c", options = {} },
	conflict = { suffix = "x", options = {} },
	diagnostic = { suffix = "d", options = {} },
	file = { suffix = "f", options = {} },
	indent = { suffix = "i", options = {} },
	jump = { suffix = "j", options = {} },
	location = { suffix = "l", options = {} },
	oldfile = { suffix = "o", options = {} },
	quickfix = { suffix = "q", options = {} },
	treesitter = { suffix = "t", options = {} },
	undo = { suffix = "", options = {} }, --"u"
	window = { suffix = "w", options = {} },
	yank = { suffix = "", options = {} },
})

require("mini.surround").setup({
	mappings = {
		add = "sa", -- Add surrounding in Normal and Visual modes
		delete = "sd", -- Delete surrounding
		find = "sf", -- Find surrounding (to the right)
		find_left = "sF", -- Find surrounding (to the left)
		highlight = "sh", -- Highlight surrounding
		replace = "sr", -- Replace surrounding

		suffix_last = "l", -- Suffix to search with "prev" method
		suffix_next = "n", -- Suffix to search with "next" method
	},
})
