return {
  'David-Kunz/gen.nvim',
  config = function()
    require('gen').model = 'zephyr'
    vim.keymap.set({'n','v','o'}, '<localleader>g', '<cmd>Gen<cr>', { desc = 'Generate' })
  end,
}
