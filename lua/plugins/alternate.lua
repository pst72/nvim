
local function gh(repo)
	return "https://github.com/" .. repo
end

-- Useful plugin to show you pending keybinds.
vim.pack.add({ gh("rmagatti/alternate-toggler") })

config = function()
  require("alternate-toggler").setup({

    -- enabled = true,
    -- lazy = true,
    -- cmd = "ToggleAlternate",
    -- opts = {
    alternates = {
      ["true"] = "false",
      ["true,"] = "false,",
      ["True"] = "False",
      ["TRUE"] = "FALSE",
      ["Yes"] = "No",
      ["yes"] = "no",
      ["YES"] = "NO",
      ["on"] = "off",
      ["On"] = "Off",
      ["ON"] = "OFF",
      ["up"] = "down",
      ["Up"] = "Down",
      ["UP"] = "DOWN",
      ["enabled"] = "disabled",
      ["Enabled"] = "Disabled",
      ["ENABLED"] = "DISABLED",
      ["2"] = "0",
      ["<"] = ">",
      ["("] = ")",
      ["["] = "]",
      ["{"] = "}",
      ['"'] = "'",
      ['""'] = "''",
      ["+"] = "-",
      ["==="] = "!==",
      ["=="] = "!=",
    }
    -- },
  })
  end,
require("alternate-toggler")
vim.keymap.set("n", "\\a", "<cmd>ToggleAlternate<cr>", { desc = "[A]lternate" })
