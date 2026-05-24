-- Show available keymaps in a popup

vim.pack.add({
	{ src = 'https://github.com/folke/which-key.nvim' },
})

require('which-key').setup({
	delay = 0,
	icons = {
		mappings = vim.g.have_nerd_font,
	},
})
