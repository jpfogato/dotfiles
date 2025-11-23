-- sets the root of the project as best as it can for when we use
-- <Leader>ff, so the search starts at the root of the project's directory

return {
	"ahmedkhalf/project.nvim",
	init = function()
		require("project_nvim").setup {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	end
}
