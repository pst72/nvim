return {
  'rmagatti/alternate-toggler',
  -- local status_ok, alt = pcall(require, "alternate-toggler")
  -- if not status_ok then
  --     return
  -- end

  opts = {
    alternates = {
      ['true'] = 'false',
      ['True'] = 'False',
      ['TRUE'] = 'FALSE',
      ['Yes'] = 'No',
      ['yes'] = 'no',
      ['YES'] = 'NO',
      ['1'] = '0',
      ['<'] = '>',
      ['('] = ')',
      ['['] = ']',
      ['{'] = '}',
      ['"'] = "'",
      ['""'] = "''",
      ['+'] = '-',
      ['==='] = '!==',
      ['=='] = '!=',
    },
  },
  vim.keymap.set('n', '<leader>aa', '<cmd>ToggleAlternate<cr>'),
}
