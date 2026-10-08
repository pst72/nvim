local function gh(repo)
	return "https://github.com/" .. repo
end

vim.pack.add({ gh("lewis6991/gitsigns.nvim") })

require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	-- key mappings only active in a git repo
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]h", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { desc = "Next Hunk" })

		map("n", "[h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[h", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { desc = "Previous Hunk" })

		-- Actions
		map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
		map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset Hunk" })

		map("v", "<leader>ghs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage Hunk" })

		map("v", "<leader>ghr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset Hunk" })

		map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
		map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
		map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
		map("n", "<leader>ghi", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })

		map("n", "<leader>ghb", function()
			gitsigns.blame_line({ full = true })
		end, { desc = "Line Blame" })

		map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Diff" })

		map("n", "<leader>ghD", function()
			gitsigns.diffthis("~")
		end, { desc = "Diff Repo" })

		map("n", "<leader>ghQ", function()
			gitsigns.setqflist("all")
		end, { desc = "QuickFix 'all'" })
		map("n", "<leader>ghq", gitsigns.setqflist, { desc = "QuickFix List" })

		-- Toggles
		map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "Toggle Line Blame" })
		map("n", "<leader>gtw", gitsigns.toggle_word_diff, { desc = "Toggle Word Diff" })

		-- Text object
		map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "In Hunk" })
	end,
})
