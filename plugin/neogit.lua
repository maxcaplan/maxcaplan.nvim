-- Interactive git interface

vim.pack.add({
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/esmuellert/codediff.nvim' },
	{ src = 'https://github.com/m00qek/baleia.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/NeogitOrg/neogit' },
})

require('baleia').setup()
require('codediff').setup()

require('neogit').setup({
	graph_style = 'unicode',
	process_spinner = true,
	kind = 'floating',
	commit_editor = {
		kind = 'floating',
		staged_diff_split_kind = 'auto',
	},
	log_view = {
		kind = 'floating',
		show_title = true,
	},
	reflog_view = {
		kind = 'floating',
		show_title = true,
	},
	stash = {
		kind = 'floating',
		show_title = true,
	},
	refs_view = {
		kind = 'floating',
		show_title = true,
	},
	treesitter_diff_highlight = true,
	diff_viewer = 'codediff',
	signs = {
		hunk = { '', '' },
		item = { '', '' },
		section = { '', '' },
	},
})

vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>', { desc = 'Open [g]it interface' })
