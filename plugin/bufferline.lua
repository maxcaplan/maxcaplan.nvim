-- Editor tabline ui

vim.pack.add({
	{ src = 'https://github.com/akinsho/bufferline.nvim' },
})

require('bufferline').setup({
	options = {
		offsets = {
			{
				filetype = 'neo-tree',
				separator = true,
			},
		},
	},
	highlights = {
		offset_separator = {
			fg = {
				attribute = 'bg',
				highlight = 'WinSeparator',
			},
		},
	},
})
