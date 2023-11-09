local M = {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  module = 'persistence',
  config = function()
    require('persistence').setup()
  end,
}
vim.keymap.set('n', '<localleader>ss', '<cmd>lua require("persistence").load()<cr>', { desc = 'Load Session' })
vim.keymap.set('n', '<localleader>sl', '<cmd>lua require("persistence").load({ last = true })<cr>', { desc = 'Load Last Session' })
vim.keymap.set('n', '<localleader>sd', '<cmd>lua require("persistence").stop()<cr>', { desc = "Don't Save Session" })
return M
