-- Editor notification manager

vim.pack.add({
	{ src = 'https://github.com/rcarriga/nvim-notify' },
})

local notify = require('notify')

notify.setup({
	stages = 'static',
	merge_duplicates = true,
})

-- Override default notify function with plufin method
vim.notify = notify
