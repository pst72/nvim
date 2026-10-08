local function gh(repo)
	return "https://github.com/" .. repo
end

vim.pack.add({ gh("MeanderingProgrammer/render-markdown.nvim") })

require("render-markdown").setup({
	enabled = true,
	-- Vim modes that will show a rendered view of the markdown file, :h mode(), for all enabled
	-- components. Individual components can be enabled for other modes. Remaining modes will be
	-- unaffected by this plugin.
	render_modes = { "n", "c", "t" },
	latex = { enabled = false },
	indent = { enabled = true },
	restart_highlighter = true,
	completions = {
		blink = { enabled = true },
		lsp = { enabled = true },
		filter = {
			callout = function()
				-- example to exclude obsidian callouts
				-- return value.category ~= 'obsidian'
				return true
			end,
			checkbox = function()
				return true
			end,
		},
	},
})

vim.keymap.set("n", "\\m", "<cmd>RenderMarkdown toggle<cr>", { desc = "Markdown View" })
vim.keymap.set("n", "<leader>mp", "<cmd>RenderMarkdown preview<cr>", { desc = "Markdown View" })
