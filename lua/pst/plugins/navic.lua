-- local M = {
--   'SmiteshP/nvim-navic',
--   lazy = true,
--   dependencies = 'neovim/nvim-lspconfig',
--   init = require('pst.core.utils.functions').on_attach(function(client, buffer)
--     if client.server_capabilities.documentSymbolProvider then
--       require('nvim-navic').attach(client, buffer)
--     end
--   end),
-- }
--
-- return M
-- local navic = require('nvim-navic').setup {
--   lsp = {
--     auto_attach = true,
--   },
-- }

return {
  'SmiteshP/nvim-navic',
  lazy = true,
  dependencies = 'neovim/nvim-lspconfig',
  opts = {
    lsp = {
      auto_attach = true
    }
  }
}
