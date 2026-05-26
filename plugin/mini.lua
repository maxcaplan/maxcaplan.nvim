-- Minimal tools library

vim.pack.add({
	{ src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
})

-- Icons

if not MiniIcons then
	require('mini.icons').setup()
	MiniIcons.mock_nvim_web_devicons()
end

-- Statusline

local statusline = require('mini.statusline')

statusline.setup({
	use_icons = vim.g.have_nerd_font,
})

-- Set status line location section to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
	return '%2l:%-2v'
end
