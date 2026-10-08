vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<localleader>r", "<cmd>restart edit #<1<cr>", { desc = "Restart nvim" })

vim.keymap.set("n", "<leader>w", "<cmd>write!<cr>", { desc = "Save File" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>x", "<cmd>bdelete!<CR>", { desc = "Close the buffer you are in." })
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-=", "<C-w>=")

-- Commandline helpers
vim.keymap.set("c", "<C-a>", "<Home>") -- beginning of cmdline
vim.keymap.set("c", "<C-e>", "<End>") -- end of cmdline
vim.keymap.set("c", "<C-b>", "<Left>") -- left 1 char
vim.keymap.set("c", "<C-f>", "<Right>")
vim.keymap.set("c", "<C-d>", "<Delete>")

-- Auto-close pairs (simple, no plugin needed)
-- vim.keymap.set("i", "`", "``<left>")
-- vim.keymap.set("i", '"', '""<left>')
-- vim.keymap.set("i", "(", "()<left>")
-- vim.keymap.set("i", "[", "[]<left>")
-- vim.keymap.set("i", "{", "{}<left>")
-- vim.keymap.set("i", "<", "<><left>")
-- -- Note: Single quotes commented out to avoid conflicts in some contexts
-- vim.keymap.set("i", "'", "''<left>")

-- Resize with arrows
vim.keymap.set("n", "<M-k>", ":resize -5<CR>", { desc = "Resize Up" })
vim.keymap.set("n", "<M-j>", ":resize +5<CR>", { desc = "Resize Down" })
vim.keymap.set("n", "<M-h>", ":vertical resize -5<CR>", { desc = "Resize Left" })
vim.keymap.set("n", "<M-l>", ":vertical resize +5<CR>", { desc = "Resize Right" })

-- Move lines up or down in visual mode
vim.keymap.set("v", "<S-j>", ":move +1<CR>gv=gv", { desc = "Move Selection Down" })
vim.keymap.set("v", "<S-k>", ":move -2<CR>gv=gv", { desc = "Move Selection Up " })

-- paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Comments
vim.keymap.set({ "n", "v" }, "<leader>c", "<cmd>normal gcc<cr>", { desc = "Add Comment " })
vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
-- Centre Focus on middle screen
-- vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz") --
vim.keymap.set("n", "<C-o>", "<C-o>zz") --
vim.keymap.set("n", "<C-u>", "<C-u>zz") --
vim.keymap.set("n", "<C-d>", "<C-d>zz") --
-- better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

vim.keymap.set({ "t" }, "<ESC><ESC>", "<ESC>", { desc = "fast <Esc>" })
-- Replace word
vim.cmd([[nmap rw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])
vim.cmd([[vmap rw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])

vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear highlights" })

vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })
-- make current file executable
vim.keymap.set("n", "\\x", "<cmd>!chmod +x %<CR>", { desc = "Make current file executable" })

-- toggle Python Documentation
-- vim.keymap.set("n", "\\p", "<cmd>PyDoc<CR>", { desc = "Python Docs" })

-- toggle UndoTree
vim.keymap.set("n", "\\u", "<cmd>Undotree<CR>", { desc = "UndoTree Toggle" })

vim.keymap.set({ "n", "x" }, "<leader>ls", ":'<,'>lua<cr>", { desc = "Source File " })
vim.keymap.set("n", "<leader>fn", "<cmd>enew <cr>", { desc = "New File" })

vim.keymap.set("n", "<localleader>pp", ":lua vim.pack.update(nil, { offline = true })<cr>", { desc = "Plugins" })
vim.keymap.set("n", "<localleader>pu", "<cmd>lua vim.pack.update()<cr>", { desc = "Update Plugins" })
-- vim.keymap.set("n", "<localleader>pc", "<cmd>ZPack clean<cr>", { desc = "Clean Unused Plugins" })
vim.keymap.set("n", "<localleader>pd", "<cmd>lua vim.pack.delete()<cr>", { desc = "Delete Plugin" })

vim.keymap.set("n", "<leader>li", "<cmd>checkhealth vim.lsp<cr>", { desc = "Lsp Info " })
vim.keymap.set("n", "<leader>lh", "<cmd>checkhealth <cr>", { desc = "Checkhealth" })
vim.keymap.set("n", "<leader>lc", "<cmd>ConformInfo <cr>", { desc = "ConformInfo " })
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()  <cr>", { desc = "Rename" })
vim.keymap.set("n", "<leader>lm", "<cmd>Mason <cr>", { desc = "Mason" })

-- vim.keymap.set("n", "<localleader>ll", "<cmd>Lazy <cr>", { desc = "Lazy Info " })

vim.keymap.set("n", "\\d", "<cmd>lua Snacks.dashboard() <cr>", { desc = "Dashboard" })
vim.keymap.set("n", "\\h", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

-- local wk = require("which-key")
-- wk.add({
-- 	{ "<leader>f", group = " Find" }, -- group
-- 	{ "<leader>n", group = " Noice" }, -- group
-- 	{ "<leader>m", group = " Markdown", icon = "" }, -- group
-- 	{ "<leader>s", group = " Search" }, -- group
-- 	{ "<leader>g", group = " Git", icon = "" }, -- group
-- 	{ "<leader>gh", group = " Hunk" }, -- group
-- 	{ "<leader>gt", group = " Toggle" }, -- group
-- 	{ "<leader>l", group = " Lsp" }, -- group
-- 	{ "<leader>d", group = " Document" }, -- group
-- 	{ "<leader>t", group = " Terminal" }, -- group
-- 	{ "<leader>u", group = " UI" }, -- group
-- 	{ "<localleader>x", group = " Trouble" }, -- group
-- 	{ "<localleader>l", group = " Lazy" }, -- group
-- 	{
-- 		"<leader>b",
-- 		group = "buffers",
-- 		expand = function()
-- 			return require("which-key.extras").expand.buf()
-- 		end,
-- 		{ "\\", group = " Toggle" }, -- group
-- 	},
-- 	-- {
-- 	--   -- Nested mappings are allowed and can be added in any order
-- 	--   -- Most attributes can be inherited or overridden on any level
-- 	--   -- There's no limit to the depth of nesting
-- 	--   mode = { "n", "v" }, -- NORMAL and VISUAL mode
-- 	--   { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
-- 	--   { "<leader>w", "<cmd>w<cr>", desc = "Write" },
-- 	-- }
-- })
--
-- vim.keymap.set("n", "<leader>e", "<CMD>Oil --float --preview<CR>", { desc = "Open parent directory" }),
