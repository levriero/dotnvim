-- [[ Configure nvim-tree ]]
-- see `:help nvim-tree-setup`
return function()
	local icons = {
		documents = require("modules.utils.icons").get("documents"),
		git = require("modules.utils.icons").get("git"),
		ui = require("modules.utils.icons").get("ui"),
	}

	require('nvim-tree').setup({
		open_on_setup = false,
		update_focused_file = {
			enable = true
		},
		view = {
			width = 30
		},
		renderer = {
			icons = {
				glyphs = {
					default = icons.documents.Default,
					symlink = icons.documents.Symlink,
					bookmark = icons.ui.Bookmark,
					git = {
						unstaged = icons.git.Mod_alt,
						staged = icons.git.Add,
						unmerged = icons.git.Unmerged,
						renamed = icons.git.Rename,
						untracked = icons.git.Untracked,
						deleted = icons.git.Remove,
						ignored = icons.git.Ignore,
					},
					folder = {
						default = icons.ui.Folder,
						open = icons.ui.FolderOpen,
						empty = icons.ui.EmptyFolder,
						empty_open = icons.ui.EmptyFolderOpen,
						symlink = icons.ui.SymlinkFolder,
						symlink_open = icons.ui.FolderOpen,
					},
				}
			}
		}
	})
end
