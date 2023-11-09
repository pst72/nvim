local M = {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require 'pst.plugins.lsp.null-ls'
  end,
}

return M
