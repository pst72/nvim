-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = {
    'qf',
    'query',
    'help',
    'man',
    'notify',
    'lspinfo',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'checkhealth',
    'PlenaryTestPopup',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = event.buf, silent = true })
  end,
})
-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  -- group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match '^%w%w+://' then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

vim.g.cursorhold_updatetime = 250
vim.cmd [[
    augroup remember-cursor-position
        autocmd!
        autocmd BufReadPost * if line ("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
     augroup END
    ]]
vim.cmd [[
  au CursorHoldI * stopinsert
  au InsertEnter * let updaterestore=&updatetime | set updatetime=10000
  au InsertLeave * let &updatetime=updaterestore
]]
-- vim.api.nvim_exec(
--     [[
--   augroup SetMarkdownFt
--     autocmd!
--     autocmd BufFilePre,BufRead,BufNewFile *.md,*.MD,*.mdwn,*.mkdn,*.mkd,*.mdown,*.markdown set ft=markdown
--   augroup END
-- ]],
--     false
-- )

-- Remove statusline and tabline when in Alpha
-- vim.api.nvim_create_autocmd({ "User" }, {
--   pattern = { "AlphaReady" },
--   callback = function()
--     vim.cmd([[
--       set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
--       set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
--     ]])
--   end,
-- })

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  callback = function(event)
    if not vim.b[event.buf].view_activated then
      local filetype = vim.api.nvim_get_option_value('filetype', { buf = event.buf })
      local buftype = vim.api.nvim_get_option_value('buftype', { buf = event.buf })
      local ignore_filetypes = { 'gitcommit', 'gitrebase', 'svg', 'hgcommit' }
      if buftype == '' and filetype and filetype ~= '' and not vim.tbl_contains(ignore_filetypes, filetype) then
        vim.b[event.buf].view_activated = true
        vim.cmd.loadview { mods = { emsg_silent = true } }
      end
    end
    vim.cmd 'set formatoptions-=cro'
  end,
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 200 }
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})

vim.cmd [[nmap rw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]]
vim.cmd [[vmap rw :%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]]
return {}
