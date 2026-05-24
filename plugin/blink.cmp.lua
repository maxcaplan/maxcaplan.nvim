-- Code completion engine

vim.pack.add({
	{ src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
	{ src = 'https://github.com/saghen/blink.cmp', version = 'v1' },
})

-- Ensure mini icons is setup
if not MiniIcons then
	require('mini.icons').setup()
	MiniIcons.mock_nvim_web_devicons()
end

local blink = require('blink.cmp')

---Get an icon for an item draw context
---@param ctx blink.cmp.DrawItemContext
local function get_item_icon(ctx) return MiniIcons.get('lsp', ctx.kind) end

blink.setup({
	keymap = { preset = 'super-tab' },
	snippets = { preset = 'luasnip' },
	completion = {
		documentation = {
			-- Auto show documentation for completion item
			auto_show = true,
			auto_show_delay_ms = 0,
		},
		menu = {
			draw = {
				padding = { 0, 1 },
				components = {
					-- Set menu item icons
					kind_icon = {
						text = function(ctx)
							local icon, _ = get_item_icon(ctx)
							return ' ' .. (icon or ctx.kind_icon) .. ctx.icon_gap
						end,

						highlight = function(ctx)
							local _, hl = get_item_icon(ctx)
							return (hl or ctx.kind_hl)
						end,
					},
					kind = {
						highlight = function(ctx)
							local _, hl = get_item_icon(ctx)
							return (hl or ctx.kind_hl)
						end,
					},
				},
			},
		},
	},
})

-- Add blink capabilities to lsps
vim.lsp.config('*', {
	capabilities = blink.get_lsp_capabilities(),
})
