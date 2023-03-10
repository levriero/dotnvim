local global = {}

function global:load_variables()
	self.home = os.getenv("HOME")
	self.data_dir = vim.fn.stdpath("data")
	self.is_mac = vim.loop.os_uname().sysname == "Darwin"

	-- Display cursor as Block on normal, visual, command, showmatch. Beam on Insert
	-- See `:h guicursor`
	self.cursor_style = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
end

global:load_variables()

return global
