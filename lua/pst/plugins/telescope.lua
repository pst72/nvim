return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'crispgm/telescope-heading.nvim',
    'benfowler/telescope-luasnip.nvim',
    'nvim-telescope/telescope-symbols.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'ptethng/telescope-makefile',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    -- Search stuff
    { '<leader>sc', '<cmd>Telescope commands<cr>', desc = 'Commands' },
    { '<leader>st', '<cmd>Telescope live_grep<cr>', desc = 'Strings' },
    { '<leader>s?', '<cmd>Telescope help_tags<cr>', desc = 'Help' },
    { '<leader>sh', '<cmd>Telescope heading<cr>', desc = 'Headings' },
    { '<leader>ss', '<cmd>Telescope luasnip<cr>', desc = 'Snippets' },
    { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
    { '<leader>sv', '<cmd>Telescope vim_options<cr>', desc = 'Vim Options' },
    { '<leader>sp', '<cmd>Telescope projects<cr>', desc = 'Projects' },
    { '<leader>sr', '<cmd>Telescope registers<cr>', desc = 'Registers' },
    { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = 'Text under cursor' },
    { '<leader>sm', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages' },
    { '<leader>s/', '<cmd>Telescope search_history<cr>', desc = 'Search History' },
    { '<leader>s:', '<cmd>Telescope command_history<cr>', desc = 'Command history' },
    {
      '<leader>sf',
      "<cmd>lua require'telescope.builtin'.grep_string{ shorten_path = true, word_match = '-w', only_sort_text = true, search = '' }<cr>",
      desc = 'Fuzzy search',
    },

    -- Actions/Toggles
    {
      '<leader>ar',
      '<cmd>Telescope resume<cr>',
      desc = 'Telescope Resume Last Action ',
    },
    {
      '<leader>at',
      '<cmd>Telescope treesitter<cr>',
      desc = 'Treesitter Functions ',
    },
    -- Git
    { '<leader>gh', '<cmd>Telescope git_branches<cr>', desc = 'Branches' },
    { '<leader>gs', '<cmd>Telescope git_status<cr>', desc = 'Status' },
    { '<leader>gm', '<cmd>Telescope git_commits<cr>', desc = 'Commits' },
    -- files
    { '<leader>fb', '<cmd>Telescope file_browser grouped=true<cr>', desc = 'Filebrowser' },
    { '<leader>fm', '<cmd>Telescope marks <cr>', desc = 'Marks' },
    { '<leader>fj', '<cmd>Telescope jumplist <cr>', desc = 'Jumplist' },
    -- { "<leader>ff",      "<cmd>" .. require("core.utils.functions").project_files() .. "<cr>", desc = "Open file" },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent files' },
    -- misc
    { '<leader>mm', '<cmd>Telescope make<cr>', desc = 'Run make' },
    { '<leader>mt', '<cmd>Telescope<cr>', desc = 'Telescope' },
    -- Other
    { '<leader><space>', '<cmd>Telescope buffers<cr>', desc = 'Bufferlist' },
    -- { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in buffer" },
  },
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer]' }),
  config = function()
    local settings = require 'pst.core.settings'
    local telescope = require 'telescope'
    local telescopeConfig = require 'telescope.config'
    local actions = require 'telescope.actions'
    local action_layout = require 'telescope.actions.layout'
    local fb_actions = require('telescope').extensions.file_browser.actions
    local icons = require 'pst.core.utils.icons'

    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
    if settings.telescope_grep_hidden then
      table.insert(vimgrep_arguments, '--hidden')
    end
    -- trim the indentation at the beginning of presented line
    table.insert(vimgrep_arguments, '--trim')

    local fzf_opts = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    }

    telescope.setup {
      extensions = {
        fzf = fzf_opts,
        ['ui-select'] = {
          require('telescope.themes').get_ivy {}, -- 'get_cursor, get_dropdown, get_ivy'
        },
        file_browser = {
          theme = 'ivy',
          preview = true,
          hijack_netrw = true,
          hidden = true,
          mappings = {
            i = {
              ['<c-N>'] = fb_actions.create,
              ['<c-r>'] = fb_actions.rename,
              -- ["<c-h>"] = actions.which_key,
              ['<c-h>'] = fb_actions.toggle_hidden,
              ['<c-n>'] = actions.cycle_history_next,
              ['<c-p>'] = actions.cycle_history_prev,
              ['<c-x>'] = fb_actions.remove,
              ['<c-m>'] = fb_actions.move,
              ['<c-y>'] = fb_actions.copy,
              ['<c-a>'] = fb_actions.select_all,
            },
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
          sort_mru = true,
        },
        colorscheme = {
          enable_preview = true,
          layout_config = {
            -- preview_width = 0.7,
          },
        },
        live_grep = {
          sorter = telescope.extensions.fzf.native_fzf_sorter(fzf_opts),
          only_sort_text = true, -- grep for content and not file name/path
          mappings = {
            i = { ['<c-f>'] = require('telescope.actions').to_fuzzy_refine },
          },
        },
      },
      defaults = {
        file_ignore_patterns = settings.telescope_file_ignore_patterns,
        vimgrep_arguments = vimgrep_arguments,
        mappings = {
          i = {
            -- Close on first esc instead of going to normal mode
            -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
            -- ['<esc>'] = actions.close,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-Up>'] = actions.results_scrolling_up,
            ['<C-Down>'] = actions.results_scrolling_down,
            ['<PageUp>'] = actions.preview_scrolling_up,
            ['<PageDown>'] = actions.preview_scrolling_down,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.send_selected_to_qflist,
            ['<C-l>'] = actions.send_to_qflist,
            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
            ['<cr>'] = actions.select_default,
            ['<c-v>'] = actions.select_vertical,
            ['<c-s>'] = actions.select_horizontal,
            ['<c-t>'] = actions.select_tab,
            ['<c-P>'] = action_layout.toggle_preview,
            ['<c-o>'] = action_layout.toggle_mirror,
            ['<c-h>'] = actions.which_key,
            ['<c-n>'] = actions.cycle_history_next,
            ['<c-p>'] = actions.cycle_history_prev,
            ['<c-x>'] = actions.delete_buffer,
          },
          n = {
            ['<PageUp>'] = actions.preview_scrolling_up,
            ['<PageDown>'] = actions.preview_scrolling_down,
          },
        },
        prompt_prefix = '  ',
        selection_caret = ' ',
        entry_prefix = '  ',
        multi_icon = icons.arrows.Diamond,
        initial_mode = 'insert',
        scroll_strategy = 'cycle',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'flex',
        layout_config = {
          width = 0.95,
          height = 0.85,
          preview_cutoff = 120,
          prompt_position = 'top',
          horizontal = {
            preview_width = function(_, cols, _)
              if cols > 200 then
                return math.floor(cols * 0.4)
              else
                return math.floor(cols * 0.6)
              end
            end,
          },
          vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
          flex = { horizontal = { preview_width = 0.9 } },
        },
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      },
    }

    telescope.load_extension 'projects'
    telescope.load_extension 'heading'
    telescope.load_extension 'luasnip'
    telescope.load_extension 'file_browser'
    telescope.load_extension 'ui-select'
    telescope.load_extension 'make'
    telescope.load_extension 'noice'
    telescope.load_extension 'fzf'
  end,
}
