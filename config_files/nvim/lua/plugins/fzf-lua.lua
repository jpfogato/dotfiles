-- all keymaps for this plugin must have the f prefix

return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	opts = {},
	keys = {
		{ "<Leader>ff",
			function() require ('fzf-lua').files() end,
			desc="[f]iles in cwd"
		},

		{ "<Leader>fr",
			function() require ('fzf-lua').live_grep() end,
			desc="g[r]ep in cwd"
		},

		{ "<Leader>fnc",
			function() require ('fzf-lua').files({cwd = vim.fn.stdpath("config")}) end,
			desc="Neovim [c]onfiguration"
		},
		
		{ "<Leader>fgs",
			function() require ('fzf-lua').git_status() end,
			desc="find git [s]tatus"
		},

		{ "<Leader>fgb",
			function() require ('fzf-lua').git_branches() end,
			desc="find [g]it [b]ranch"
		},

		{ "<Leader>fnb",
			function() require ('fzf-lua').builtin() end,
			desc="Neovim [b]uiltins"
		},


		{ "<Leader>fnh",
			function() require ('fzf-lua').builtin() end,
			desc="Neovim [h]elp"
		},

		{ "<Leader>fk",
			function() require ('fzf-lua').keymaps() end,
			desc="[k]eymaps"
		},

		{ "<Leader>fw",
			function() require ('fzf-lua').grep_cword() end,
			desc="find selected [w]ord"
		},


		{ "<Leader>fW",
			function() require ('fzf-lua').grep_cWORD() end,
			desc="find selected [W]ORD"
		},

		{ "<Leader>fR",
			function() require ('fzf-lua').resume() end,
			desc="[R]esume search session"
		},

		{ "<Leader>fo",
			function() require ('fzf-lua').oldfiles() end,
			desc="find [o]ld files"
		},

		{ "<Leader><Leader>",
			function() require ('fzf-lua').buffers() end,
			desc="[ ] switch between files"
		},

		{ "<Leader>/",
			function() require ('fzf-lua').lgrep_curbuf() end,
			desc="[/] Live grep current buffer"
		},



	}
}
