vim.keymap.set("n", "<leader>ac", "<cmd>ColorizerToggle<CR>", { desc = "Toggle colorizer" })
return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		local status, colorizer = pcall(require, "colorizer")
		if not status then
			print("COLORIZER NOT LOADED")
			return
		end

		colorizer.setup({
			"*",
		})
	end,
}
