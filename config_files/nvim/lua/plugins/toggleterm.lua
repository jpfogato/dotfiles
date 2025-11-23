-- terminal application
-- keymaps:
--
return {
	"akinsho/toggleterm.nvim",
	version = "*",

	opts = {
		-- dynamic size example (horizontal/vertical)
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,

		open_mapping = [[<c-\>]], -- toggle with Ctrl+\
		start_in_insert = true,
		insert_mappings = true,
		terminal_mappings = true,

		hide_numbers = true,
		shade_terminals = true,
		shading_factor = -30,
		persist_size = true,
		persist_mode = true,
		direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
		close_on_exit = true,
		shell = vim.o.shell,
		auto_scroll = true,

		highlights = {
			Normal = { link = "Normal" },
			NormalFloat = { link = "NormalFloat" },
			FloatBorder = { link = "FloatBorder" },
		},

		float_opts = {
			border = "curved",
			width = math.floor(vim.o.columns * 0.8),
			height = math.floor(vim.o.lines * 0.8),
			winblend = 3,
			title_pos = "center",
		},

		winbar = {
			enabled = false,
			name_formatter = function(term)
				return term.name
			end,
		},

		responsiveness = {
			horizontal_breakpoint = 135,
		},
	},

	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- Define helper functions for quick access to terminals
		local Terminal = require("toggleterm.terminal").Terminal

		local float_term = Terminal:new({ direction = "float", hidden = true })
		local horiz_term = Terminal:new({ direction = "horizontal", hidden = true })
		local vert_term = Terminal:new({ direction = "vertical", hidden = true })

		-- Toggle keymaps
		vim.keymap.set({ "n", "t" }, "<leader>tf", function()
			float_term:toggle()
		end, { desc = "[f]loating" })

		vim.keymap.set({ "n", "t" }, "<leader>th", function()
			horiz_term:toggle()
		end, { desc = "[h]orizontal" })

		vim.keymap.set({ "n", "t" }, "<leader>tv", function()
			vert_term:toggle()
		end, { desc = "[v]ertical" })
	end,
}
