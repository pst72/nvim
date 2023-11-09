local M = {
  'BooleanCube/keylab.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    LINES = 10, -- 10 by default
    force_accuracy = false, -- true by default
    correct_fg = '#FFFFFF', -- #B8BB26 by default
    wrong_bg = '#000000', -- #FB4934 by default
  },
  -- keys = {
  --   vim.keymap.set('n', '<leader>kl', require('keylab').start, { desc = 'Start a keylab session' }),
  -- },
}
return M
