-- #TODO: read the text objects available in the git repository

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { 
		"nvim-treesitter/nvim-treesitter"
	},
	init = function()
		local config = require'nvim-treesitter.configs';
		config.setup ({
			textobjects = {
				select = {
				enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						["of"] = { query = "@function.outer", desc = "Select outside a function" },-- outside a function
						["if"] = { query = "@function.inner", desc = "Select inside a function" },-- inside a funcion
						["oc"] = { query = "@class.outer", desc = "Select around a class definition" }, -- outside a class
						["ic"] = { query = "@class.inner", desc = "Select inside a class definition" },
						["o#"] = { query = "@comment.outer", desc = "Select next comment" },

					},
					-- mapping query_strings to modes.
					selection_modes = {
						['@parameter.outer'] = 'v', -- charwise
						['@function.outer'] = 'V', -- linewise
						['@class.outer'] = '<c-v>', -- blockwise
					},
					-- selects only the desire text, not succeeding chars such as spaces and CRLF 
					include_surrounding_whitespace = false,
				}, -- This closing brace was missing for the 'select' section
				swap = {
					enable = true,
					swap_next = {
						["<Leader>,"] = {query = "@parameter.inner", desc = "Swaps position with next param"},
					},
					swap_previous = {
						["<Leader>."] = {query="@parameter.inner", desc="Swaps position with previous param"},
					},
				},
			},
		})
	end
}
