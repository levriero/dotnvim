local global = {}

function global:load_variables()
  self.home = os.getenv("HOME")
  self.is_mac = vim.loop.os_uname().sysname == "Darwin"
end

global:load_variables()

return global
