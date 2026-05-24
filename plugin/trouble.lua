-- Diagnostics UI

vim.pack.add({
	{ src = 'https://github.com/folke/trouble.nvim' },
})

require('trouble').setup()

vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics' })
vim.keymap.set('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Diagnostics symbols' })
vim.keymap.set(
	'n',
	'<leader>cl',
	'<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
	{ desc = 'LSP Definitions / references / ...' }
)
vim.keymap.set('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Diagnostics location List' })
vim.keymap.set('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Diagnostics quickfix list' })
