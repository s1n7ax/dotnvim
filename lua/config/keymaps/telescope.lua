local wk = require('which-key')

local rg_glob_list = {
	'!.git/',
	'!node_modules/',
	'!target/',
	'!sass_cache/',
}

local rg_options = {
	'--no-ignore',
	'--hidden',
	'--files',
}

if #rg_options ~= 0 then
	for _, ignore_item in ipairs(rg_glob_list) do
		table.insert(rg_options, '--glob=' .. ignore_item)
	end
end

local rg_command = string.format(
	'<cmd>Telescope find_files find_command=rg,%s<CR>',
	table.concat(rg_options, ',')
)

wk.register({
	name = 'Telescope',
	[',,'] = { rg_command, 'Find Files' },
})
