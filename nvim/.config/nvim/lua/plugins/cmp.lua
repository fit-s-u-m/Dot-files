return { -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

		  require("luasnip.loaders.from_vscode").lazy_load()

			luasnip.config.setup({})

		   local cmp_kinds = {
						Text = "󰉿",            -- Generic text
						Method = "󰆧",          -- Method
						Function = "󰊕",        -- Function
						Constructor = "",      -- Constructor
						Field = "",           -- Object field
						Variable = "󰀫",        -- Variable
						Class = "󰌗",          -- Class
						Interface = "",       -- Interface
						Module = "󰏗",         -- Module or namespace
						Property = "",        -- Object property
						Unit = "",           -- Unit
						Value = "󰎠",          -- Value or literal
						Enum = "",           -- Enum
						Keyword = "󰌋",        -- Language keyword
						Snippet = "",        -- Snippet
						Color = "󰏘",          -- Color picker or swatch
						File = "󰈙",           -- File
						Reference = "󰈇",      -- Reference or pointer
						Folder = "󰉋",         -- Folder
						EnumMember = "",     -- Enum member
						Constant = "󰏿",       -- Constant or literal
						Struct = "󰙅",         -- Struct or record
						Event = "",          -- Event
						Operator = "󰆕",       -- Operator
						TypeParameter = "󰉺",   -- Type parameter
						Codeium = ""
		    }



		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			-- completion = { completeopt = "menu,menuone,noinsert" },
			window = {
				completion = {
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				},
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				},
			},

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Scroll the documentation window [b]ack / [f]orward
				["<C-j>"] = cmp.mapping.scroll_docs(-4),
				["<C-k>"] = cmp.mapping.scroll_docs(4),

				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				-- Manually trigger a completion from nvim-cmp.
				["<C-Space>"] = cmp.mapping.complete({}),
				['<Tab>'] = cmp.mapping(function(fallback)
					    if cmp.visible() then
					      cmp.select_next_item()
					    elseif luasnip.expand_or_jumpable() then
					      luasnip.expand_or_jump()
					    else
					      fallback()
					    end
					  end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					    if cmp.visible() then
					      cmp.select_prev_item()
					    elseif luasnip.jumpable(-1) then
					      luasnip.jump(-1)
					    else
					      fallback()
					    end
					  end, { 'i', 's' }),
			}),

			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				  { name = "buffer", option = {
				    get_bufnrs = function()
					local bufs = {}
					for _, win in ipairs(vim.api.nvim_list_wins()) do
					    bufs[vim.api.nvim_win_get_buf(win)] = true
					end
					return vim.tbl_keys(bufs)
				    end
				}},
				{ name = "path" },
			},
			formatting = {
				format = function(entry, vim_item)
				    vim_item.kind = cmp_kinds[vim_item.kind] or ""
				    vim_item.menu = ({
					buffer = "🅱",
					nvim_lsp = "🅻",
					luasnip = "㊊",
					path = "🛠",
				    })[entry.source.name] or ""
				    return vim_item
				end,
			},
	})
	end,
}
