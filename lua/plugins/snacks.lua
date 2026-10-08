local function gh(repo)
	return "https://github.com/" .. repo
end
vim.pack.add({
	{
		src = gh("folke/snacks.nvim"),
	},
})
require("snacks").setup({
	bigfile = { enabled = true },
	image = {},
	dashboard = {
		enabled = true,
		sections = {
			{ section = "header" },
			-- {
			--   pane = 2,
			--   section = "terminal",
			--   cmd = "colorscript -e square",
			--   height = 5,
			--   padding = 1,
			-- },
			{ section = "keys", gap = 1, padding = 1 },
			{
				pane = 2,
				icon = " ",
				title = "Recent Files",
				section = "recent_files",
				indent = 2,
				padding = 1,
			},
			{
				pane = 2,
				icon = " ",
				title = "Projects",
				section = "projects",
				indent = 2,
				padding = 1,
			},
			{
				pane = 2,
				icon = " ",
				title = "Git Status",
				section = "terminal",
				enabled = function()
					return Snacks.git.get_root() ~= nil
				end,
				cmd = "git status --short --branch --renames",
				height = 5,
				padding = 1,
				ttl = 5 * 60,
				indent = 3,
			},
			-- { section = "startup" },
		},
	},
	explorer = {
		enabled = true,
		cwd = vim.fn.expand("%:p:h"),
		auto_close = true,
		layout = { preset = "vertical" },
		-- jump = { close = true },
	},
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = {
		enabled = true,
		win = {
			input = {
				keys = {
					["<a-s>"] = { "flash", mode = { "n", "i" } },
					["s"] = { "flash" },
				},
			},
		},
		actions = {
			flash = function(picker)
				require("flash").jump({
					pattern = "^",
					label = { after = { 0, 0 } },
					search = {
						mode = "search",
						exclude = {
							function(win)
								return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
							end,
						},
					},
					action = function(match)
						local idx = picker.list:row2idx(match.pos[1])
						picker.list:_move(idx, true, true)
					end,
				})
			end,
		},
	},
	terminal = {
		bo = {
			filetype = "snacks_terminal",
		},
		wo = {},
		keys = {
			q = "hide",
			gf = function(self)
				local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
				if f == "" then
					Snacks.notify.warn("No file under cursor")
				else
					self:hide()
					vim.schedule(function()
						vim.cmd("e " .. f)
					end)
				end
			end,
			term_normal = {
				"<esc>",
				function(self)
					self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
					if self.esc_timer:is_active() then
						self.esc_timer:stop()
						vim.cmd("stopinsert")
					else
						self.esc_timer:start(200, 0, function() end)
						return "<esc>"
					end
				end,
				mode = "t",
				expr = true,
				desc = "Double escape to normal mode",
			},
		},
	},

	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		float = {
			border = "rounded",
		},
		notification = {
			wo = { wrap = true }, -- Wrap notifications
		},
	},
})

vim.keymap.set("n", "<leader><space>", function()
	Snacks.picker.smart()
end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>,", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })
vim.keymap.set("n", "<leader>nH", function()
	Snacks.picker.notifications()
end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>E", function()
	Snacks.picker.explorer({
		cwd = vim.fn.expand("%:p:h"),
		auto_close = true,
		layout = { preset = "vertical", preview = true },
	})
end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.git_files()
end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>sp", function()
	Snacks.picker.projects()
end, { desc = "Projects" })
vim.keymap.set("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Recent" })
vim.keymap.set("n", "<leader>gB", function()
	Snacks.picker.git_branches()
end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function()
	Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function()
	Snacks.picker.git_stash()
end, { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function()
	Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gf", function()
	Snacks.picker.git_log_file()
end, { desc = "Git Log File" })
vim.keymap.set("n", "<leader>sl", function()
	Snacks.picker.lines()
end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sb", function()
	Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })
vim.keymap.set("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })
-- 		-- search
vim.keymap.set("n", '<leader>s"', function()
	Snacks.picker.registers()
end, { desc = "Registers" })
vim.keymap.set("n", "<leader>s/", function()
	Snacks.picker.search_history()
end, { desc = "Search History" })
vim.keymap.set("n", "<leader>sa", function()
	Snacks.picker.autocmds()
end, { desc = "Autocmds" })
vim.keymap.set("n", "<leader>sc", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function()
	Snacks.picker.commands()
end, { desc = "Commands" })
vim.keymap.set("n", "<leader>lD", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>ld", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function()
	Snacks.picker.highlights()
end, { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function()
	Snacks.picker.icons()
end, { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function()
	Snacks.picker.jumps()
end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>ll", function()
	Snacks.picker.loclist()
end, { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function()
	Snacks.picker.marks()
end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function()
	Snacks.picker.man()
end, { desc = "Man Pages" })
vim.keymap.set("n", "<localleader>lp", function()
	Snacks.picker.lazy()
end, { desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<leader>lq", function()
	Snacks.picker.qflist()
end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>sr", function()
	Snacks.picker.resume()
end, { desc = "Resume" })
vim.keymap.set("n", "<leader>su", function()
	Snacks.picker.undo()
end, { desc = "Undo History" })
vim.keymap.set("n", "<leader>fC", function()
	Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })
--
-- 		-- LSP
-- 		{
-- 			"gd",
-- 			function()
-- 				Snacks.picker.lsp_definitions()
-- 			end,
-- 			desc = "Goto Definition",
-- 		},
-- 		{
-- 			"gD",
-- 			function()
-- 				Snacks.picker.lsp_declarations()
-- 			end,
-- 			desc = "Goto Declaration",
-- 		},
-- 		{
-- 			"gr",
-- 			function()
-- 				Snacks.picker.lsp_references()
-- 			end,
-- 			nowait = true,
-- 			desc = "References",
-- 		},
-- 		{
-- 			"gI",
-- 			function()
-- 				Snacks.picker.lsp_implementations()
-- 			end,
-- 			desc = "Goto Implementation",
-- 		},
-- 		{
vim.keymap.set("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>ss", function()
	Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })
-- 		{
vim.keymap.set("n", "<leader>lI", function()
	Snacks.picker.lsp_config()
end, { desc = "LSP Servers" })
vim.keymap.set("n", "<leader>sS", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })
vim.keymap.set("n", "\\Z", function()
	Snacks.zen()
end, { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "\\z", function()
	Snacks.zen.zoom()
end, { desc = "Toggle Zoom" })
vim.keymap.set("n", "<leader>.", function()
	Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<leader>S", function()
	Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })
vim.keymap.set("n", "<leader>nh", function()
	Snacks.notifier.show_history()
end, { desc = "Notification History" })
-- 		-- {
vim.keymap.set("n", "<leader>x", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>fR", function()
	Snacks.rename.rename_file()
end, { desc = "Rename File" })
vim.keymap.set({ "n", "v" }, "<leader>gb", function()
	Snacks.gitbrowse()
end, { desc = "Git Browse" })
-- 		{
vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })
-- 		--   "<leader>un",
-- 		--   function()
-- 		--     Snacks.notifier.hide()
-- 		--   end,
-- 		--   desc = "Dismiss All Notifications",
-- 		-- },
-- 		{
vim.keymap.set("n", "<c-\\>", function()
	Snacks.terminal.toggle("/usr/bin/zsh")
end, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<localleader>tm", function()
	Snacks.terminal.open({ "glow" })
end, { desc = "Glow" })
vim.keymap.set("n", "<localleader>tp", function()
	Snacks.terminal.open({ "bpython" })
end, { desc = "Bpython" })
-- 			"]]",
-- 			function()
-- 				Snacks.words.jump(vim.v.count1)
-- 			end,
-- 			desc = "Next Reference",
-- 			mode = { "n", "t" },
-- 		},
-- 		{
-- 			"[[",
-- 			function()
-- 				Snacks.words.jump(-vim.v.count1)
-- 			end,
-- 			desc = "Prev Reference",
-- 			mode = { "n", "t" },
-- 		},
-- 	},
-- init = function()
vim.api.nvim_create_autocmd("User", {
	callback = function()
		-- Setup some globals for debugging (lazy-loaded)
		-- _G.dd = function(...)
		-- 	Snacks.debug.inspect(...)
		-- end
		-- _G.bt = function()
		-- 	Snacks.debug.backtrace()
		-- end
		-- vim.print = _G.dd -- Override print to use snacks for `:=` command

		-- Create some toggle mappings
		Snacks.toggle.option("spell", { name = "Spelling" }):map("\\s")
		Snacks.toggle.option("wrap", { name = "Wrap" }):map("\\w")
		Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("\\r")
		Snacks.toggle.diagnostics():map("\\l")
		Snacks.toggle.line_number():map("\\L")
		Snacks.toggle
			.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
			:map("\\C")
		Snacks.toggle.treesitter():map("\\t")
		-- Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
		-- Snacks.toggle.inlay_hints():map("<leader>uh")
		Snacks.toggle.indent():map("\\i")
		Snacks.toggle.dim():map("\\D")
	end,
})
