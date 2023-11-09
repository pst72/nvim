-- local M = {}

-- M._keys = {
-- Shorten function name
-- local keymap = vim.keymap.set
-- Silent keymap option
-- local opts = { silent = true }

--Remap space as leader key
-- keymap('', '<Space>', '<Nop>', opts)
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ','

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap('n', '<C-h>', '<C-w>h', opts)
-- keymap('n', '<C-j>', '<C-w>j', opts)
-- keymap('n', '<C-k>', '<C-w>k', opts)
-- keymap('n', '<C-l>', '<C-w>l', opts)
-- keymap('n', '<C-=>', '<C-w>=', opts)

-- keymap('n', 'j', 'gj', opts)
-- keymap('n', 'k', 'gk', opts)
-- keymap('n', '<Down>', 'gj', opts)
-- keymap('n', '<Up>', 'gk', opts)
-- keymap('i', '<Down>', '<C-o>gj', opts)
-- keymap('i', '<Up>', '<C-o>gk', opts)
-- Centre Focus on middle screen
-- keymap('n', 'G', 'Gzz', opts)
-- keymap('n', 'n', 'nzz', opts)
-- keymap('n', 'N', 'Nzz', opts)
-- keymap('n', '}', '}zz', opts)
-- keymap('n', '{', '{zz', opts)
-- Move selected text
-- keymap('x', 'J', ":m '>+3<CR>gv=gv", { desc = 'Join line below to current line' })
-- keymap('v', 'J', ":m '>+3<CR>gv=gv", opts)
-- keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
-- keymap('x', 'K', ":m '<-2<CR>gv=gv", opts)
-- Resize with arrows
-- keymap('n', '<C-Up>', ':resize -1<CR>', { desc = 'Resize Up' })
-- keymap('n', '<C-Down>', ':resize +5<CR>', { desc = 'Resize Down' })
-- keymap('n', '<C-Left>', ':vertical resize -1<CR>', { desc = 'Resize Left' })
-- keymap('n', '<C-Right>', ':vertical resize +5<CR>', { desc = 'Resize Right' })

-- Lazynvim keymaps
-- keymap('n', '<localleader>l', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })

-- Keylab Typing Practice
-- keymap('n', '<leader>kl', require('keylab').start, { desc = 'Start a keylab session' })

-- Telescope
-- keymap('n', '<localleader>b', '<cmd>Telescope builtin<cr>', { desc = 'Telescope Builtins' })

-- Translate Keymap
-- keymap('n', 'tw', ':TransSelectDirection <cr>', { desc = 'Translate Word/s' })
-- keymap('v', 'tw', ":'<'>TransSelectDirection <cr>", { desc = 'Translate Word/s' })

-- Navigate buffers
-- keymap('n', ']b', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
-- keymap('n', '[b', '<cmd>bprevious<CR>', { desc = 'Previous Buffer' })

-- Clear highlights
-- keymap('n', '<F6>', '<cmd>nohlsearch<CR>', { desc = 'Toggle Search Highlight' })

-- Set spell
-- keymap('n', '<F5>', '<cmd>setlocal spell!<CR>', { desc = 'Toggle SpellCheck.' })

-- Run Code in Terminal
-- keymap('n', '<F10>', '<cmd>Jaq <CR>', { desc = 'Run Code in Float' })
-- keymap('n', '<F10>', require('jaq-nvim').Jaq, { desc = 'Run Code in Float' })

-- Close buffers
-- keymap('n', '<leader>x', '<cmd>bdelete!<CR>', { desc = 'Close the buffer you are in.' })

-- Save File
-- keymap('n', '<leader>w', '<cmd>write!<CR>', { desc = 'Save the File' })

-- Close Nvim
-- keymap('n', '<leader>q', '<cmd>quit<CR>', { desc = 'Exit Neovim' })
-- keymap('n', '<leader>Q', '<cmd>quit!<CR>', { desc = 'Exit Neovim WITHOUT Saving' })

-- Better paste
-- keymap('v', 'p', '"_dP', opts)

-- Select All
-- keymap('n', '<C-a>', 'gg<S-v>G', { desc = 'Select All' })

--No register for x
-- keymap("n", "x", '"_x')

--Increment/Decrament
-- keymap('n', '+', '<C-a>', { desc = 'Increment a Number' })
-- keymap('n', '-', '<C-x>', { desc = 'Decrament a Number' })

-- Insert --
-- Press jk fast to enter
-- keymap('i', 'jk', '<ESC>', { desc = 'Fast <Esc>' })
-- keymap('i', 'qq', '<ESC>', { desc = 'fast <Esc>' })
-- keymap('i', '<ESC>', '<ESC>', { desc = 'fast <Esc>' })

-- Visual --
-- Stay in indent mode
-- keymap('v', '<', '<gv', opts)
-- keymap('v', '>', '>gv', opts)

-- Plugins --

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "NvimTree Toggle" }, opts)

-- Telescope
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>fg", ":Telescope current_buffer_fuzzy_find<CR>", opts)
-- keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- keymap("n", "<leader>rf", ":LspToggleFmt<CR>", opts)

-- Git
-- keymap('n', '<leader>gg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { desc = 'LazyGit' })

-- keymap('i', '<C-s>', '<cmd>Telescope symbols<cr>', { desc = 'Insert symbols / Emojies' })
-- keymap('n', '<C-s>', '<cmd>Telescope symbols<cr>', { desc = 'Insert symbols / Emojies' })

-- Playground
-- Comment
-- keymap(
--   "n",
--   "<leader>c",
--   "<cmd>gcc<cr>",
--   -- "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
--   { desc = "Comment out line" },
--   opts
-- )
-- keymap(
--   "x",
--   "<leader>c",
--   '<ESC><CMD>lua require("Comment.api").toggle.linewise.op(vim.fn.visualmode())<CR>',
--   { desc = "Comment out Visual Selection" },
--   opts
-- )
-- keymap('n', '<leader>?', '<cmd>Cheatsheet<CR>', { desc = 'Cheatsheet for Commands' })
-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Dap-BreakPoint" })
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Dap-Continue" })
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Dap-Step-Into" })
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Dap-Step-Over" })
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Dap-Step-Out" })
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Dap-Repl" })
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Dap-Run-Last" })
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "Dap-Toggle" })
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", { desc = "Dap-Terminate" })

-- keymap('i', '<C-Up>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-2)<cr>")
-- keymap('i', '<C-Down>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(6)<cr>")
-- Setup keymaps for Hover
-- keymap('n', 'K', "<cmd>lua require('hover').hover()<cr>", { desc = 'hover.nvim' })
-- keymap('n', 'gK', "<cmd>lua require('hover').hover_select()<cr>", { desc = 'hover.nvim (select)' })
-- local wk = require 'which-key'

-- register non leader based mappings
-- wk.register {
--   sa = 'Add surrounding',
--   sd = 'Delete surrounding',
--   sh = 'Highlight surrounding',
--   sn = 'Surround update n lines',
--   sr = 'Replace surrounding',
--   sF = 'Find left surrounding',
--   sf = 'Replace right surrounding',
--   ss = { '<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<cr>', 'Jump to character' },
--   st = { "<cmd>lua require('tsht').nodes()<cr>", 'TS hint textobject' },
-- }

-- Register leader based mappings
-- wk.register({
-- ["<tab>"] = { "<cmd>e#<cr>", "Prev buffer" },
-- b = {
--   name = 'Buffers',
--   D = {
--     '<cmd>%bd|e#|bd#<cr>',
--     'Close all but the current buffer',
--   },
--   d = { '<cmd>Bdelete<cr>', 'Close buffer' },
-- },
-- l = { 'LSP' }, -- core.plugins.lsp.keys
-- lw = { 'Workspaces' }, -- core.plugins.lsp.keys
-- gh = { name = 'Hunks' }, -- core.plugins.lsp.keys
-- f = {
--   name = 'Find',
--   -- s = { "<cmd>w<cr>", "Save Buffer" },
-- },
-- d = {
--   name = 'DAP',
--   b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'Dap-BreakPoint' },
--   c = { "<cmd>lua require'dap'.continue()<cr>", 'Dap-Continue' },
--   i = { "<cmd>lua require'dap'.step_into()<cr>", 'Dap-Step-Into' },
--   o = { "<cmd>lua require'dap'.step_over()<cr>", 'Dap-Step-Over' },
--   O = { "<cmd>lua require'dap'.step_out()<cr>", 'Dap-Step-Out' },
--   r = { "<cmd>lua require'dap'.repl.toggle()<cr>", 'Dap-Repl' },
--   l = { "<cmd>lua require'dap'.run_last()<cr>", 'Dap-Run-Last' },
--   u = { "<cmd>lua require'dapui'.toggle()<cr>", 'Dap-Toggle' },
--   t = { "<cmd>lua require'dap'.terminate()<cr>", 'Dap-Terminate' },
-- },
-- s = {
--   name = 'Search',
--   -- s = { "<cmd>w<cr>", "Save Buffer" },
-- },
-- j = {
--   name = 'Jag Code-Runner',
--   j = { '<cmd>Jaq<cr>', 'Run Code in Float' },
--   h = { '<cmd>Jaq terminal<cr>', 'Run Code in Horizontal' },
--   i = { '<cmd>Jaq internal<cr>', 'Source Code ' },
--   b = { '<cmd>Jaq bang<cr>', 'Run Code in StatusLine' },
--   q = { '<cmd>Jaq quickfix<cr>', 'Run Code in Quickfix' },
-- },
-- m = {
--   name = 'Misc',
--   l = { '<cmd>source ~/.config/nvim/snippets/*<cr>', 'Reload snippets' },
--   p = { '<cmd>Lazy check<cr>', 'Lazy check' },
-- },
-- a = {
--   name = 'Action',
--   a = { '<cmd>ToggleAlternate<cr>', 'Alternate Toggle' },
--   c = { '<cmd>ColorizerToggle<cr>', 'Colorizer Toggle' },
--   s = { '<cmd>SymbolsOutline<cr>', 'SymbolsOutline Toggle' },
--   -- k = { "<cmd>cprevious<cr>", "Previous Quickfix Item" },
--   -- q = { "<cmd>lua require('core.utils.functions').toggle_qf()<cr>", "Toggle quickfix list" },
--   p = { '<cmd>TSPlaygroundToggle<cr>', 'Playground Toggle' },
--   -- t = { "<cmd>TodoQuickFix<cr>", "Show TODOs" },
-- },
-- t = { name = 'Toggle' },
-- hydra heads
-- s = { "Search" },
-- w = { "Windows" },
-- z = { "Spelling" },
-- }, { prefix = '<leader>', mode = 'n', {} })
-- return M
