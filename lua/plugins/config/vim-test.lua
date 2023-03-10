return function()
	vim.api.nvim_exec([[
		function FTermStrategy(cmd)
			execute "lua require('FTerm').run('" . a:cmd . "')"
		endfunction

		let g:test#custom_strategies = { "fterm": function("FTermStrategy") }
		let g:test#strategy = "fterm"
	]], false)
end
