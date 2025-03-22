return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>ut", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })
		vim.keymap.set("n", "<leader>uT", "<cmd>UndotreeToggle<CR>", { desc = "Undo tree toggle" })
	end,
}
