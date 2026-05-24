-- Code snippet engine

vim.pack.add({
	{
		src = 'https://github.com/L3MON4D3/LuaSnip',
		version = vim.version.range('2.x'),
	},
	{
		-- Snippet library
		src = 'https://github.com/rafamadriz/friendly-snippets',
	},
})

require('luasnip').setup()
require('luasnip.loaders.from_vscode').lazy_load()
