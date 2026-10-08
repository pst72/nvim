vim.cmd([[ set syntax=ON ]])
vim.cmd([[ let g:loaded_perl_provider = 0 ]])
vim.cmd([[let g:node_host_prog = '/usr/bin/neovim-node-host']])
vim.cmd([[ packadd nvim.undotree ]])
local opt = vim.opt
opt.number = true
opt.relativenumber = true
-- opt.autocomplete = true    -- already using blink autocomplete
opt.autochdir = true
-- vim.opt.path = ".,,*,**,;," -- Finding files - Search down into folders
vim.opt.path:append(".,,*,**,;") -- Finding files - Search down into folders
opt.ignorecase = true -- Ignore case
opt.smartcase = true
opt.smoothscroll = true
opt.scrolloff = 4 -- Lines of context
opt.sidescrolloff = 4 -- Lines of context
opt.cmdheight = 0 -- no cmdline unless it is being used
opt.foldlevel = 99
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.list = true -- Show some invisible characters (tabs...
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.cursorline = true -- Enable highlighting of the current line
opt.cursorlineopt = "both" --  number, screenline' -- can be 'line','screenline','number'
opt.laststatus = 3 -- global statusline
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.splitkeep = "screen"
opt.mouse = "a" -- Enable mouse mode
opt.shortmess:append({ W = true, I = true, c = true, a = true })
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.undolevels = 10000
opt.formatoptions = "jcroqlnt" -- tcqj
opt.formatexpr = "v:lua.vim.lsp.formatexpr()"
opt.complete:append("i")
opt.completeopt = "noselect,fuzzy,preview,menuone,popup" -- noselect
opt.matchpairs:append("<:>")
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.shiftround = true -- Round indent
opt.smartindent = true -- Insert indents automatically
opt.foldmethod = "expr"
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep --hidden --smart-case"
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.showmode = false -- Dont show mode since we have a statusline
-- opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.winborder = "rounded"
-- opt.foldlevel = 99
opt.linebreak = true -- Wrap lines at convenient points
opt.pumblend = 5 -- Popup blend
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
capabilities = vim.tbl_deep_extend("force", capabilities, {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
})
