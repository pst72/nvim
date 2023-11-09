-- Comment
vim.keymap.set({ 'n', 'v' }, '<leader>c', "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = 'Comment out line' })
return {
  'numToStr/Comment.nvim',
  opts = {
    toggler = {
      line = 'gcc',
      block = 'gbc',
    },
  },
}
