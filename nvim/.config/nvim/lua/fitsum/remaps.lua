vim.g.mapleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("i", "jj", "<Esc>", { desc = "Esc" })

-- hank related
vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>ht", ":Gitsigns toggle_current_line_blame <CR>", { desc = "toggle current line blame" })

-- lazy-git
vim.keymap.set("n", "<leader>gl", ":LazyGit <CR>", { desc = "Open lazy git" })

--  clipboard
function ToggleClipboard()
	local current_clipboard = vim.opt.clipboard:get()
	if vim.tbl_contains(current_clipboard, "unnamedplus") then
		vim.opt.clipboard = ""
		print("Clipboard set to default")
	else
		vim.opt.clipboard = "unnamedplus"
		print("Clipboard set to unnamedplus")
	end
end
vim.keymap.set("n", "<leader>tc", ":lua ToggleClipboard()<CR>", { desc = "Toogle global clipboard" })

-- splits
vim.keymap.set("n", "<leader>sv", ":vsplit %<CR>", { desc = "toggle current line blame" })
vim.keymap.set("n", "<leader>sh", ":hsplit %<CR>", { desc = "toggle current line blame" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close split" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<C-q>", "<cmd>bdelete %<CR>", { desc = "delete buffer" })

-- finder
vim.keymap.set("n", "<C-\\>", "<cmd>Explore<CR>", { desc = "open file explorer" })

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')

-- See `:help telescope.builtin`
-- Obsidian
vim.keymap.set(
	"n",
	"<leader>oc",
	"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
	{ desc = "Obsidian Check Checkbox" }
)
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })

-- Open parent directory
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
