-- File tree navigation for

vim.pack.add({
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/MunifTanjim/nui.nvim' },
	{ src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
	{
		src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
		version = vim.version.range('3'),
	},
})

-- Ensure mini icons are setup
if not MiniIcons then
	require('mini.icons').setup()
	MiniIcons.mock_nvim_web_devicons()
end

require('neo-tree').setup({
	filesystem = {
		hijack_netrw_behavior = 'open_current',
	},
})

-- Toggle file explorer
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle reveal_force_cwd<CR>', { desc = 'Toggle File [E]xplorer' })
-- Toggle buffers explorer
vim.keymap.set('n', '<leader>b', '<Cmd>Neotree toggle show buffers right<CR>', { desc = 'Toggle [B]uffer Explorer' })
-- Toggle git explorer
vim.keymap.set(
	'n',
	'<leader>gg',
	'<Cmd>Neotree toggle show git_status left<CR>',
	{ desc = 'Toggle [G]it Status Explorer' }
)
