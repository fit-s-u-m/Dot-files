-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true
vim.opt.relativenumber = true

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.conceallevel = 1
vim.o.termguicolors = true

-- Set shell to bash or your preferred shell
vim.opt.shell = "/run/current-system/sw/bin/zsh"

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
-- transparent
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

vim.opt.hlsearch = true
vim.opt.incsearch = true

if vim.g.neovide then
	vim.g.neovide_transparency = 0.3
	vim.g.neovide_window_blurred = true
	-- shadow
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5
end
