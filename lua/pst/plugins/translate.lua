-- Translate Keymap
vim.keymap.set("n", "tw", ":TransSelectDirection <cr>", { desc = "Translate Word/s" })
vim.keymap.set("v", "tw", ":'<'>TransSelectDirection <cr>", { desc = "Translate Word/s" })
vim.cmd([[let g:trans_advanced_options = "-brief"]])
vim.cmd([[let g:trans_default_direction="en:fr"]])
vim.cmd([[let g:trans_interactive_full_list = 1]])
vim.cmd([[let g:trans_directions_list = [
          \['en', 'fr'],
          \['fr', 'en'],
          \['en', 'de'],
          \['de', 'en'],
          \['en', 'es'],
          \['es', 'en'],
          \['en', 'it'],
          \['it', 'en'],
          \['en', 'tl'],
          \['tl', 'en'],
          \['en', 'ht'],
          \['ht', 'en'],
          \['en', 'la'],
          \['la', 'en'],
          \['en', 'xh'],
          \['xh', 'en'],
          \['en', 'id'],
          \['id', 'en'],
          \['en', 'zu'],
          \['zu', 'en'],
  \]
  ]])
return {
  "echuraev/translate-shell.vim",
}
