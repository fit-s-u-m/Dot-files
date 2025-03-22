return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			"nvim-telescope/telescope.nvim", -- optional
		},
		config = function()
			local neogit = require("neogit")

			vim.keymap.set("n", "<leader>gs", neogit.open, { silent = true, noremap = true, desc = "open Neogit" })

			vim.keymap.set(
				"n",
				"<leader>gc",
				":Neogit commit<CR>",
				{ silent = true, noremap = true, desc = "commit with Neogit" }
			)

			vim.keymap.set(
				"n",
				"<leader>gp",
				":Neogit pull<CR>",
				{ silent = true, noremap = true, desc = "pull with Neogit" }
			)

			vim.keymap.set(
				"n",
				"<leader>gP",
				":Neogit push<CR>",
				{ silent = true, noremap = true, desc = "push with Neogit" }
			)

			vim.keymap.set(
				"n",
				"<leader>gb",
				":Telescope git_branches<CR>",
				{ silent = true, noremap = true, desc = "list git branches" }
			)

			vim.keymap.set("n", "<leader>gB", ":Git blame<CR>", { silent = true, noremap = true, desc = "git blame" })
			neogit.setup({})
		end,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		config = function()
			require("git-worktree").setup({
				-- Key mappings and other options
				change_directory_command = "cd", -- default is "cd",
				update_on_change = true, -- default is true,
				update_on_change_command = "e .", -- default is "e .",
				clearjumps_on_change = true, -- default is true,
				autopush = false, -- default is false,
			})
		end,
	},

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}
