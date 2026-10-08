local function gh(repo)
	return "https://github.com/" .. repo
end

vim.pack.add({ gh("saghen/blink.lib") })
vim.pack.add({
	{
		src = gh("folke/lazydev.nvim"),
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
			},
		},
	},
})
vim.pack.add({
	{
		src = gh("saghen/blink.cmp"),
		branch = "v1",
		-- version = vim.version.range("1.*")
	},
})
-- vim.pack.add({ gh("nvim-tree/nvim-web-devicons") })
vim.pack.add({ gh("onsails/lspkind.nvim") })
vim.pack.add({ { src = gh("L3MON4D3/LuaSnip"), version = vim.version.range("2.*") } })
require("luasnip").setup({})
vim.pack.add({ gh("rafamadriz/friendly-snippets") })
require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
	-- 'super-tab' for mappings similar to vscode (tab to accept)
	-- 'enter' for enter to accept
	-- 'none' for no mappings
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		preset = "super-tab",
		["<CR>"] = { "accept", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		["<Tab>"] = {
			function(cmp)
				if cmp.snippet_active() then
					return cmp.show_and_insert()
				else
					return cmp.select_next()
				end
			end,
			"snippet_forward",
			"select_next",
			"fallback",
		},
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		["<C-e>"] = { "cancel", "fallback" },
	},
	term = {
		enabled = true,
	},
	cmdline = {
		enabled = true,
		keymap = { preset = "inherit" },
		completion = { menu = { auto_show = true } },
		--   keymap = {
		--     -- recommended, as the default keymap will only show and select the next item
		--     ["<Tab>"] = {
		--       function(cmp)
		--         if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
		--           return cmp.accept()
		--         end
		--       end,
		--       "show_and_insert",
		--       "select_next",
		--     },
		--     ["<S-Tab>"] = { "select_prev", "show_and_insert" },
		--
		--     ["<C-space>"] = { "show", "fallback" },
		--
		--     ["<C-n>"] = { "select_next", "fallback" },
		--     ["<C-p>"] = { "select_prev", "fallback" },
		--     ["<Right>"] = { "select_next", "fallback" },
		--     ["<Left>"] = { "select_prev", "fallback" },
		--
		--     ["<CR>"] = { "accept", "fallback" },
		--     ["<C-e>"] = { "cancel" },
		--     -- ["<Esc>"] = { "cancel" },
		--   },
	},

	-- (Default) Only show the documentation popup when manually triggered
	completion = {
		documentation = { auto_show = true },
		ghost_text = {
			enabled = true,
		},
		trigger = {
			prefetch_on_insert = true,
		},
		list = {
			selection = {
				preselect = true,
				auto_insert = true,
			},
		},
		menu = {
			auto_show = true,
			-- auto_show = function()
			--   return vim.fn.getcmdtype() == ":"
			--     -- enable for inputs as well, with:
			--     or vim.fn.getcmdtype() == "@"
			-- end,
			draw = {
				treesitter = { "lsp" },
				components = {
					kind_icon = {
						text = function(ctx)
							local icon = ctx.kind_icon
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									icon = dev_icon
								end
							else
								icon = require("lspkind").symbolic(ctx.kind, {
									mode = "symbol",
								})
							end

							return icon .. ctx.icon_gap
						end,

						-- Optionally, use the highlight groups from nvim-web-devicons
						-- You can also add the same function for `kind.highlight` if you want to
						-- keep the highlight groups in sync with the icons.
						highlight = function(ctx)
							local hl = ctx.kind_hl
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									hl = dev_hl
								end
							end
							return hl
						end,
					},
				},
			},
		},
	},

	signature = { enabled = true },
	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "lazydev" },
		-- min_keyword_length = 2,
		providers = {
			lsp = { fallbacks = {} },
			snippets = {
				opts = {
					friendly_snippets = true, -- default
					global_snippets = { "all" },

					-- see the list of frameworks in: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
					-- and search for possible languages in: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
					-- the following is just an example, you should only enable the frameworks that you use
					extended_filetypes = {
						-- markdown = { 'jekyll' },
						-- sh = { 'shelldoc' },
						-- php = { 'phpdoc' },
						-- cpp = { 'unreal' }
					},
				},
			},
			path = {
				module = "blink.cmp.sources.path",
				score_offset = 3,
				fallbacks = { "buffer" },
				opts = {
					trailing_slash = true,
					label_trailing_slash = true,
					get_cwd = function(context)
						return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
					end,
					show_hidden_files_by_default = true,
					-- Treat `/path` as starting from the current working directory (cwd) instead of the root of your filesystem
					ignore_root_slash = false,
				},
			},
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},

	fuzzy = { implementation = "lua" },
	-- fuzzy = { implementation = "prefer_rust_with_warning" },
})

local capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
