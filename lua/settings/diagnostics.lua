-- Neovim diagnostics configuration

vim.diagnostic.config( 
	{
		-- Floating window settings
		float = { 
			border = 'rounded',
			-- Only show source in message if more than one item
			source = 'if_many',
		},

		-- Sort by severity
		severity_sort = true,
		-- Highlight messages with severity of warning or greater
		underline = { severity = { min = vim.diagnostic.severity.WARN } },
		-- Only update diagnostics when leaving insert mode
		update_in_insert = false,
		-- Message text displayed at end of line
		virtual_text = true,

		-- Auto open diagnostics float when jumping with `[d` and `]d`
		jump = {
			on_jump = function(_, bufnr)
				vim.diagnostic.open_float {
					bufnr = bufnr,
					scope = 'cursor',
					focus = false,
				}
			end,
		}
	}
)
