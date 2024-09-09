-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true
vim.opt.relativenumber = true

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.conceallevel = 1

-- Set shell to bash or your preferred shell
vim.opt.shell = "/bin/zsh"

-- Ensure shell commands behave like in Vim
vim.opt.shellcmdflag = "-c"
-- Optionally, create a key mapping for convenience
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true
vim.opt.ignorecase = true
-- vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
--
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.opt.incsearch = true
