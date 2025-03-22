return {
	"onsails/lspkind.nvim",
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	{ "numToStr/Comment.nvim", opts = {} },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
	  "L3MON4D3/LuaSnip",
	  dependencies = { "rafamadriz/friendly-snippets" },
	},
	  {
	    "folke/noice.nvim",
	    config = function()
	      require("noice").setup({
		-- add any options here
		routes = {
		  {
		    filter = {
		      event = 'msg_show',
		      any = {
			{ find = '%d+L, %d+B' },
			{ find = '; after #%d+' },
			{ find = '; before #%d+' },
			{ find = '%d fewer lines' },
			{ find = '%d more lines' },
		      },
		    },
		    opts = { skip = true },
		  }
		},
	      })
	    end,
	    dependencies = {
	      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	      "MunifTanjim/nui.nvim",
	      "rcarriga/nvim-notify",
	    }
	},
	{
		'xiyaowong/nvim-transparent',
		config = function()
			require("transparent").setup({
			  -- table: default groups
			  groups = {
			    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
			    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
			    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
			    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
			    'EndOfBuffer',
			  },
			  -- table: additional groups that should be cleared
			  extra_groups = {
				   "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
			},
			  -- table: groups you don't want to clear
			  exclude_groups = {},
			  -- function: code to be executed after highlight groups are cleared
			  -- Also the user event "TransparentClear" will be triggered
			  on_clear = function() end,
		})
		end,
	},
  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 15; -- Height of the floating window
        border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
        default_mappings = true;
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
        };
        -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
        focus_on_open = true; -- Focus the floating window when opening it.
        dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true, -- Whether to nest floating windows
        preview_window_title = { enable = true, position = "left" }, -- Whether 
      }
    end
  },
	
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    }
  },

	{
		"folke/which-key.nvim",
		event = "VeryLazy", -- Sets the loading event to 'VimEnter'
		opts = {
			config = function() -- This is the function that runs, AFTER loading
				require("which-key").setup()

				-- Document existing key chains
				require("which-key").add({
					{ "<leader>c", name = "[C]ode", _ = "which_key_ignore" },
					{ "<leader>d", name = "[D]ocument", _ = "which_key_ignore" },
					{ "<leader>r", name = "[R]ename", _ = "which_key_ignore" },
					{ "<leader>si", name = "[S]earch", _ = "which_key_ignore" },
					{ "<leader>w", name = "[W]orkspace", _ = "which_key_ignore" },
				})
			end,
		},
	},
	"mg979/vim-visual-multi",
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				java = { "google_java_format", "prettier" },
			},
		},
	},
	{
		"catppuccin/nvim", 
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{"brenoprata10/nvim-highlight-colors",},
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			require("mini.ai").setup({ n_lines = 500 })

			require("mini.pairs").setup()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
		{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
		{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
		{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
		{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},
}
