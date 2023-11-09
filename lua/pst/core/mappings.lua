local utils = require 'pst.core.utils.functions'
local map = vim.keymap.set

-- Remap for dealing with visual line wraps
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

map({ 'n', 'i' }, '<C-s>', '<cmd>Telescope symbols<cr>', { desc = 'Insert symbols / Emojies' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- paste over currently selected text without yanking it
map('v', 'p', '"_dp')
map('v', 'P', '"_dP')

-- switch buffer
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
-- Normal --
-- Better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-=>', '<C-w>=')

map('n', 'L', '$') -- Go to end of line
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('n', '<Down>', 'gj')
map('n', '<Up>', 'gk')
map('i', '<Down>', '<C-o>gj')
map('i', '<Up>', '<C-o>gk')
-- Centre Focus on middle screen
map('n', 'G', 'Gzz')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', '}', '}zz')
map('n', '{', '{zz')
-- Move selected text
map('x', 'J', ":m '>+3<CR>gv=gv", { desc = 'Join line below to current line' })
map('x', 'K', ":m '<-2<CR>gv=gv")
map('v', 'J', ":m '>+3<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
-- Resize with arrows
map('n', '<C-Up>', ':resize -1<CR>', { desc = 'Resize Up' })
map('n', '<C-Down>', ':resize +5<CR>', { desc = 'Resize Down' })
map('n', '<C-Left>', ':vertical resize -1<CR>', { desc = 'Resize Left' })
map('n', '<C-Right>', ':vertical resize +5<CR>', { desc = 'Resize Right' })

-- Lazynvim keymaps
map('n', '<localleader>l', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })

-- Telescope
map('n', '<localleader>b', '<cmd>Telescope <cr>', { desc = 'Telescope Builtins' })

-- Translate Keymap
map('n', 'tw', ':TransSelectDirection <cr>', { desc = 'Translate Word/s' })
map('v', 'tw', ":'<'>TransSelectDirection <cr>", { desc = 'Translate Word/s' })

-- Clear highlights
map('n', '<F6>', '<cmd>nohlsearch<CR>', { desc = 'Toggle Search Highlight' })

-- Set spell
map('n', '<F5>', '<cmd>setlocal spell!<CR>', { desc = 'Toggle SpellCheck.' })

-- Run Code in Terminal
map('n', '<F10>', '<cmd>Jaq<CR>', { desc = 'Run Code in Float' })

-- Close buffers
map('n', '<leader>x', '<cmd>bdelete!<CR>', { desc = 'Close the buffer you are in.' })

-- Save File
map('n', '<leader>w', '<cmd>write!<CR>', { desc = 'Save the File' })

-- Close Nvim
map('n', '<leader>q', '<cmd>quit<CR>', { desc = 'Exit Neovim' })
map('n', '<localleader>q', '<cmd>q!<CR>', { desc = 'Exit Neovim without Saving' })

-- Select All
map('n', '<C-a>', 'gg<S-v>G', { desc = 'Select All' })

--No register for x
-- keymap("n", "x", '"_x')

--Increment/Decrament
map('n', '+', '<C-a>', { desc = 'Increment a Number' })
map('n', '-', '<C-x>', { desc = 'Decrament a Number' })

-- Insert Mode --
-- Press jk fast to <ESC>
map('i', 'jk', '<ESC>', { desc = 'Fast <Esc>' })
-- map('i', 'qq', '<ESC>', { desc = 'fast <Esc>' })
map('i', '<ESC>', '<ESC>', { desc = 'fast <Esc>' })

-- Cancel search highlighting with ESC
-- map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Clear hlsearch and ESC' })

-- Keylab Typing Practice
vim.keymap.set('n', '<leader>kl', '<cmd>KeylabStart<cr>', { desc = 'Start a keylab session' })

-- move over a closing element in insert mode
map('i', '<C-l>', function()
  return require('pst.core.utils.functions').escapePair()
end)

-- Search for the word under the cursor
map({ 'v', 'n', 's' }, 'sw', '<cmd>Telescope grep_string<cr>', { desc = 'Grep Word/s Under Cursor' })

-- toggles
map('n', '<localleader>th', function()
  utils.notify('Toggling hidden chars', vim.log.levels.INFO, 'pst.core.mappings')
  vim.o.list = vim.o.list == false and true or false
end, { desc = 'Toggle hidden chars' })
map('n', '<localleader>tl', function()
  utils.notify('Toggling signcolumn', vim.log.levels.INFO, 'pst.core.mappings')
  vim.o.signcolumn = vim.o.signcolumn == 'yes' and 'no' or 'yes'
end, { desc = 'Toggle signcolumn' })
map('n', '<localleader>tv', function()
  utils.notify('Toggling virtualedit', vim.log.levels.INFO, 'pst.core.mappings')
  vim.o.virtualedit = vim.o.virtualedit == 'all' and 'block' or 'all'
end, { desc = 'Toggle virtualedit' })
map('n', '<localleader>ts', function()
  utils.notify('Toggling spell', vim.log.levels.INFO, 'pst.core.mappings')
  vim.o.spell = vim.o.spell == false and true or false
end, { desc = 'Toggle spell' })
map('n', '<localleader>tw', function()
  utils.notify('Toggling wrap', vim.log.levels.INFO, 'pst.core.mappings')
  vim.o.wrap = vim.o.wrap == false and true or false
end, { desc = 'Toggle wrap' })
map('n', '<localleader>tc', function()
  utils.notify('Toggling cursorline', vim.log.levels.INFO, 'pst.core.mappings')
  vim.o.cursorline = vim.o.cursorline == false and true or false
end, { desc = 'Toggle cursorline' })
map('n', '<localleader>to', "<cmd>lua require('pst.core.utils.functions').toggle_colorcolumn()<cr>", { desc = 'Toggle colorcolumn' })
map('n', '<localleader>tt', "<cmd>lua require('pst.plugins.lsp.utils').toggle_virtual_text()<cr>", { desc = 'Toggle Virtualtext' })
map('n', '<localleader>tp', '<cmd>TSPlaygroundToggle<cr>', { desc = 'Toggle TSPlayground' })
map('n', '<localleader>ti', '<cmd>InspectTree<cr>', { desc = 'Toggle InspectTree' })
map('n', '<localleader>tz', '<cmd>ZenMode<cr>', { desc = 'Toggle Zen-Mode' })
map('n', '<localleader>tD', '<cmd>Twilight<cr>', { desc = 'Toggle Twilight-Dimming' })
map('n', '<localleader>td', '<cmd>LspStop<cr>', { desc = 'Toggle Diagnostics Off' })
map('n', '<localleader>tr', '<cmd>LspStart<cr>', { desc = 'Toggle Diagnostics On' })

local wk = require 'which-key'

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
wk.register({
  b = {
    name = 'Buffers',
    D = {
      '<cmd>%bd|e#|bd#<cr>',
      'Close all but the current buffer',
    },
    d = { '<cmd>Bdelete<cr>', 'Close buffer' },
  },
  l = { 'LSP' }, -- core.plugins.lsp.keys
  lw = { 'Workspaces' }, -- core.plugins.lsp.keys
  gh = { name = 'Hunks' }, -- core.plugins.lsp.keys
  f = {
    name = 'Files',
    o = { '<cmd>Telescope oldfiles<cr>', 'Recent Files' },
    t = { '<cmd>Telescope current_buffer_tags<cr>', 'Tags in Current Buffer' },
    T = { '<cmd>Telescope tags<cr>', 'Tags in Current Project' },
    f = { '<cmd>Telescope find_files<cr>', 'Current Directory Files' },
    g = { '<cmd>Telescope git_files<cr>', 'Git Files' },
  },
  n = {
    name = 'Noice',
    t = { '<cmd>Telescope noice<cr>', 'Telescope Noice Messages' },
    n = { '<cmd>Noice<cr>', 'Noice Messages ' },
    e = { '<cmd>NoiceErrors<cr>', 'Error Messages ' },
    m = { '<cmd>Noice history<cr>', 'All Message ' },
    l = { '<cmd>Noice last<cr>', 'Last Message ' },
    c = { '<cmd>NoiceConfig<cr>', 'Noice Config ' },
  },
  d = {
    name = 'Debug',
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'Dap-BreakPoint' },
    c = { "<cmd>lua require'dap'.continue()<cr>", 'Dap-Continue' },
    i = { "<cmd>lua require'dap'.step_into()<cr>", 'Dap-Step-Into' },
    o = { "<cmd>lua require'dap'.step_over()<cr>", 'Dap-Step-Over' },
    O = { "<cmd>lua require'dap'.step_out()<cr>", 'Dap-Step-Out' },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", 'Dap-Repl' },
    l = { "<cmd>lua require'dap'.run_last()<cr>", 'Dap-Run-Last' },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", 'Dap-Toggle' },
    t = { "<cmd>lua require'dap'.terminate()<cr>", 'Dap-Terminate' },
  },
  m = {
    name = 'Misc',
    -- C = { '<cmd>:CBcatalog<cr>', 'Commentbox Catalog' },
    l = { '<cmd>source ~/.config/nvim/snippets/*<cr>', 'Reload snippets' },
    -- p = { '<cmd>Lazy check<cr>', 'Lazy check' },
  },
  j = {
    name = 'Jag Code-Runner',
    j = { '<cmd>Jaq<cr>', 'Run Code in Float' },
    h = { '<cmd>Jaq terminal<cr>', 'Run Code in Horizontal' },
    s = { '<cmd>Jaq internal<cr>', 'Source Code ' },
    b = { '<cmd>Jaq bang<cr>', 'Run Code in StatusLine' },
    q = { '<cmd>Jaq quickfix<cr>', 'Run Code in Quickfix' },
  },
  a = {
    name = 'Action',
    a = { '<cmd>ToggleAlternate<cr>', 'Alternate Toggle' },
    c = { '<cmd>ColorizerToggle<cr>', 'Colorizer Toggle' },
    g = { '<cmd>Glow<cr>', 'Toggle Glow' },
    s = { '<cmd>SymbolsOutline<cr>', 'SymbolsOutline Toggle' },
    -- k = { "<cmd>cprevious<cr>", "Previous Quickfix Item" },
    -- q = { "<cmd>lua require('core.utils.functions').toggle_qf()<cr>", "Toggle quickfix list" },
    -- p = { '<cmd>TSPlaygroundToggle<cr>', 'Playground Toggle' },
    -- t = { "<cmd>TodoQuickFix<cr>", "Show TODOs" },
  },
  Q = {
    name = 'Quickfix',
    j = { '<cmd>cnext<cr>', 'Next Quickfix Item' },
    k = { '<cmd>cprevious<cr>', 'Previous Quickfix Item' },
    q = { "<cmd>lua require('pst.core.utils.functions').toggle_qf()<cr>", 'Toggle quickfix list' },
    t = { '<cmd>TodoQuickFix<cr>', 'Show TODOs' },
  },
  t = { name = 'Toggles' },
  -- hydra heads
  s = { 'Search' },
  sd = {
    name = '+DAP',
    c = { '<cmd>Telescope dap commands<cr>', 'Dap Commands' },
    b = { '<cmd>Telescope dap list_breakpoints<cr>', 'Dap Breakpoints' },
    g = { '<cmd>Telescope dap configurations<cr>', 'Dap Configurations' },
    v = { '<cmd>Telescope dap variables<cr>', 'Dap Variables' },
    f = { '<cmd>Telescope dap frames<cr>', 'Dap Frames' },
  },
  -- W = { 'Windows' },
  z = { 'Spelling' },
}, { prefix = '<leader>', mode = 'n', {} })
