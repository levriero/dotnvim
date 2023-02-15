local global = {}

function global:load_variables()
	self.home = os.getenv("HOME")
	self.data_dir = vim.fn.stdpath("data")
	self.is_mac = vim.loop.os_uname().sysname == "Darwin"
end

global:load_variables()

return global
