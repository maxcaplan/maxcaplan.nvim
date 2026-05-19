-- Neovim option settings

-- Enable relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Don't show editor mode as it's already in the status line
vim.o.showmode = false

-- Sync nvim and OS clipboard after start up
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Enable brak indent
vim.o.breakindent = true

-- Enable undo/redo changes persisting across file close and open
vim.o.undofile = true

-- Enable case insensitive searching by default
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease editor update and mapped sequence time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set how new splits are created 
vim.o.splitright = true
vim.o.splitbelow = true

-- Set how certain whitespace characters are displayed
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Enable substitution live preview
vim.o.inccommand = 'split'

-- Enable showing which line the cursor is in
vim.o.cursorline = true

-- Set minimum number of lines to keep above and below the cursor
vim.o.scrolloff = 10

-- Enable asking for confirmation before performing actions that would lose unsaved work
vim.o.confirm = true
