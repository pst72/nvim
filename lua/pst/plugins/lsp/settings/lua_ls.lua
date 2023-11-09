-- https://github.com/sumneko/lua-language-server/blob/master/locale/en-us/setting.lua
local opts = {
  cmd = { 'lua-language-server' },
  format = {
    enable = false, -- let null-ls handle the formatting
  },
  filetypes = { 'lua' },
  runtime = {
    version = 'LuaJIT',
    path = vim.split(package.path, ';', {}), -- delete empty parentheses
  },
  completion = { enable = true, callSnippet = 'Replace' },
  diagnostics = {
    enable = true,
    -- globals = { "vim", "describe" },
    globals = {
      'vim',
      'nnoremap',
      'vnoremap',
      'inoremap',
      'tnoremap',
      'use',
    },
  },
  workspace = {
    library = {
      vim.api.nvim_get_runtime_file('', true),
      [vim.fn.expand '$VIMRUNTIME/lua'] = true,
      [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
    },
    checkThirdParty = false,
    -- adjust these two values if your performance is not optimal
    maxPreload = 2000,
    preloadFileSize = 1000,
  },
  hover = { enable = true },
  hint = { enable = true },
  codeLens = { enable = true },
  signatureHelp = { enable = true },
  telemetry = { enable = false },
}

return opts
