return function()
	local notify = require("notify")

	notify.setup({
		stages = "fade"
	})

	-- allow other plugins to use the notification window
	vim.notify = notify
end
