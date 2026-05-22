-- Minimal tools library

vim.pack.add({
	{ src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
})

if not MiniIcons then
	require('mini.icons').setup()
	MiniIcons.mock_nvim_web_devicons()
end
