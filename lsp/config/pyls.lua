local util = require "lspconfig.util"
local log_file = vim.fn.expand("~/.pyls.log")

return {
	cmd = { "pyls", "-v", "-v", "--log-file", log_file },
	filetypes = { "python" },
	root_dir = util.root_pattern("pyproject.toml", "Pipfile", ".git", "setup.py"),
	single_file_support = true,
	settings = {
		pyls = {
			plugins = {
				rope_rename = { enabled = true },
				jedi_rename = { enabled = false },
			}
		}
	}
}
