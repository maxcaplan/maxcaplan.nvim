-- Code completion engine

vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" }
})

local blink = require('blink.cmp')

blink.setup({
	keymap = { preset = "super-tab" },
	completion = {
		documentation = {
			-- Auto show documentation for completion item
			auto_show = true,
			auto_show_delay_ms = 0
		}
	},
	snippets = { preset = "luasnip" }
})

-- Add blink capabilities to lsps
vim.lsp.config('*', {
	capabilities = blink.get_lsp_capabilities()
})
