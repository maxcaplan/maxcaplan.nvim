-- Git integration for buffers

vim.pack.add({
	{ src = 'https://github.com/lewis6991/gitsigns.nvim' },
})

require('gitsigns').setup({
	on_attach = function(bufnr)
		local gitsigns = require('gitsigns')

		local function set_buffer_keymap(mode, lhs, rhs, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Navigation
		set_buffer_keymap('n', ']c', function()
			if vim.wo.diff then
				vim.cmd.normal({ ']c', bang = true })
			else
				gitsigns.nav_hunk('next')
			end
		end, { desc = 'Jump to next git [c]hange' })

		set_buffer_keymap('n', '[c', function()
			if vim.wo.diff then
				vim.cmd.normal({ '[c', bang = true })
			else
				gitsigns.nav_hunk('prev')
			end
		end, { desc = 'Jump to prvious git [c]hange' })

		-- Actions
		set_buffer_keymap('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
		set_buffer_keymap('v', '<leader>hs', function()
			gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
		end, { desc = 'git [s]tage hunk' })

		set_buffer_keymap('n', '<leader>hr', gitsigns.stage_hunk, { desc = 'git [r]eset hunk' })
		set_buffer_keymap('v', '<leader>hr', function()
			gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
		end, { desc = 'git [r]eset hunk' })

		set_buffer_keymap('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
		set_buffer_keymap('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
		set_buffer_keymap('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
		set_buffer_keymap('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'git preview hunk [i]nline' })

		set_buffer_keymap('n', '<leader>hb', function()
			gitsigns.blame_line({ full = true })
		end, { desc = 'git [b]lame line' })

		set_buffer_keymap('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
		set_buffer_keymap('n', '<leader>hD', function()
			gitsigns.diffthis('~')
		end, { desc = 'git [D]iff against last commit' })

		set_buffer_keymap('n', '<leader>hQ', function()
			gitsigns.setqflist('all')
		end, { desc = 'git hunk [Q]uick fix list (all files)' })
		set_buffer_keymap('n', '<leader>hq', gitsigns.setqflist, { desc = 'git hunk [q]uick fix list' })

		-- Toggles
		set_buffer_keymap('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[t]oggle git [b]lame' })
		set_buffer_keymap('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = '[t]oggle git [w]ord diff' })

		-- Text object
		set_buffer_keymap({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
	end,
})
