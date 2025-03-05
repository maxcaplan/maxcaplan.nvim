return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = nil,

        offsets = {
          {
            filetype = 'neo-tree',
            test = 'File Tree',
            text_align = 'center',
            separator = true,
          },
        },

        -- always_show_bufferline = false,
      },
    }

    require('mini.bufremove').setup()

    -- Keymaps:
    -- Move to previous/next
    vim.keymap.set('n', '<C-Left>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Move to previous buffer' })
    vim.keymap.set('n', '<C-Right>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Move to next buffer' })
    -- Re-order to previous/next
    vim.keymap.set('n', '<S-Left>', '<Cmd>BufferLineMovePrev<CR>', { desc = 'Move buffer to previous position in tabline' })
    vim.keymap.set('n', '<S-Right>', '<Cmd>BufferLineMoveNext<CR>', { desc = 'Move buffer to next position in tabline' })
    -- Goto buffer at position
    vim.keymap.set('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Go to buffer at position 1' })
    vim.keymap.set('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Go to buffer at position 2' })
    vim.keymap.set('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Go to buffer at position 3' })
    vim.keymap.set('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', { desc = 'Go to buffer at position 4' })
    vim.keymap.set('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', { desc = 'Go to buffer at position 5' })
    vim.keymap.set('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', { desc = 'Go to buffer at position 6' })
    vim.keymap.set('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', { desc = 'Go to buffer at position 7' })
    vim.keymap.set('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', { desc = 'Go to buffer at position 8' })
    vim.keymap.set('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', { desc = 'Go to buffer at position 9' })
    vim.keymap.set('n', '<A-0>', '<Cmd>BufferLineGoToBuffer -1<CR>', { desc = 'Goto buffer at last position' })
    -- Close buffer
    vim.keymap.set('n', '<leader>q', MiniBufremove.delete, { desc = 'Close current buffer' })
  end,
}
