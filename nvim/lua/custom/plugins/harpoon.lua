return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2", -- will soon be made the master branch
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = true, -- required
	keys = {
		-- core functionality for adding and checking marks
		{ '<leader>ha', function() require("harpoon"):list():append() end, desc = 'Mark file with harpoon' }, -- add mark
		{ '<leader>hm', function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Show harpoon marks' }, -- show all marks

		-- navigating by number (preferrably convert this to a function from 1 to 4 for neatness)
		{ "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
		{ "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
		{ "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
		{ "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
	},
}

