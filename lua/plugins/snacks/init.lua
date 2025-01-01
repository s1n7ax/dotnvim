local logo = vim.split(
	[[

          d888            8888888888
         d8888                  d88P
           888                 d88P
.d8888b    888   88888b.      d88P  8888b.  888  888
88K        888   888 "88b  88888888    "88b `Y8bd8P'
"Y8888b.   888   888  888   d88P   .d888888   X88K
     X88   888   888  888  d88P    888  888 .d8""8b.
 88888P' 8888888 888  888 d88P     "Y888888 888  888
]],
	'\n'
)

local max = 0

for _, line in ipairs(logo) do
	if #line > max then
		max = #line
	end
end

for i, line in ipairs(logo) do
	if #line < max then
		local padding = string.rep(' ', max - #line)
		logo[i] = line .. padding
	end
end

---@class snacks.dashboard.Config
local dashboard = {
	enabled = true,
	preset = {
		header = table.concat(logo, '\n'),
	},
}

return {
	'folke/snacks.nvim',
	enabled = true,
	opts = {
		dashboard = dashboard,
		bigfile = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		scope = { enabled = false },
	},
}
