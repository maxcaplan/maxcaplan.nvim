-- Editor tabline ui

vim.pack.add({
	{ src = 'https://github.com/folke/which-key.nvim' },
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

-- Go to visible tabs 1 through 9
vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', { desc = 'Go to buffer tab [1]' })
vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', { desc = 'Go to buffer tab [2]' })
vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', { desc = 'Go to buffer tab [3]' })
vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', { desc = 'Go to buffer tab [4]' })
vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', { desc = 'Go to buffer tab [5]' })
vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', { desc = 'Go to buffer tab [6]' })
vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', { desc = 'Go to buffer tab [7]' })
vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', { desc = 'Go to buffer tab [8]' })
vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', { desc = 'Go to buffer tab [9]' })

-- Cycle previous and next tabs
vim.keymap.set('n', '<C-Left>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Go to previous buffer tab' })
vim.keymap.set('n', '<C-Right>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Go to next buffer tab' })

-- Move tab left and right
vim.keymap.set('n', '<S-Left>', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move buffer tab left' })
vim.keymap.set('n', '<S-Right>', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move buffer tab right' })

-- Close current buffer
vim.keymap.set('n', '<leader>q', '<cmd>bd<cr>', { desc = 'Close current buffer' })

local status, which_key = pcall(require, 'which-key')

if status then
	-- Hide go to buffer tab keymaps
	which_key.add({
		{ '<leader>1', hidden = true, mode = 'n' },
		{ '<leader>2', hidden = true, mode = 'n' },
		{ '<leader>3', hidden = true, mode = 'n' },
		{ '<leader>4', hidden = true, mode = 'n' },
		{ '<leader>5', hidden = true, mode = 'n' },
		{ '<leader>6', hidden = true, mode = 'n' },
		{ '<leader>7', hidden = true, mode = 'n' },
		{ '<leader>8', hidden = true, mode = 'n' },
		{ '<leader>9', hidden = true, mode = 'n' },
	})
end
