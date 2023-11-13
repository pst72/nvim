vim.keymap.set({'n','v'}, '<localleader>g', '<cmd>Gen<cr>', { desc = 'Generate' })
return {
  'David-Kunz/gen.nvim',
  config = function()
    require('gen').model = 'zephyr'
  end,
}
