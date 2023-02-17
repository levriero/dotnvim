return function()
	require("gitsigns").setup({
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = "┃",
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = "┃",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = "▁",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			topdelete = {
				hl = "GitSignsDelete",
				text = "▔",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			untracked = {
				text = "┆"
			},
		},
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

			-- Navigation
			vim.keymap.set('n', ']h', function()
				if vim.wo.diff then
					return ']h'
				end

				vim.schedule(function()
					gs.next_hunk()
				end)

				return '<Ignore>'
			end, { expr = true, desc = 'Next Hunk' })

			vim.keymap.set('n', '[h', function()
				if vim.wo.diff then
					return '[h'
				end

				vim.schedule(function()
					gs.prev_hunk()
				end)

				return '<Ignore>'
			end, { expr = true, desc = 'Prev Hunk' })

			-- Actions
			map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
			map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
			map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo Stage Hunk')
			map('n', '<leader>hp', gs.preview_hunk, 'Preview Hunk')
			map('n', '<leader>hS', gs.stage_buffer, 'Stage buffer')
			map('n', '<leader>hR', gs.reset_buffer, 'Reset buffer')
			map('n', '<leader>hb', function() gs.blame_line { full = true } end, 'Blame line')
			map('n', '<leader>hd', gs.diffthis, 'Diff this')
			map('n', '<leader>hD', function() gs.diffthis('~') end, 'Diff this ~')

			-- Text object
			map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
		end
	})
end
