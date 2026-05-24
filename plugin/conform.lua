-- Code formatter

vim.pack.add({
	{
		src = 'https://github.com/stevearc/conform.nvim',
	},
})

require('conform').setup({
	notify_on_error = false,
	default_format_opts = {
		-- Use lsp for formatting when external formatter isn't available
		lsp_format = 'fallback',
	},
	formatters_by_ft = {
		lua = { 'stylua' },
		rust = { 'rustfmt' },
	},
	format_on_save = {
		lsp_format = 'fallback',
		timeout_ms = 500,
	},
})

vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
	require('conform').format({ async = true })
end, { desc = '[F]ormat buffer' })
