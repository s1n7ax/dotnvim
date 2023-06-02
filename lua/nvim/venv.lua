local function path_builder(root_path)
	return setmetatable({ path = root_path }, {
		__call = function(context, ...)
			local abspath = context.path
			local param = { ... }

			for _, value in ipairs(param) do
				abspath = abspath .. '/' .. value
			end

			return abspath
		end,
	})
end

local pcache = path_builder(vim.fn.stdpath('cache'))
local proot = path_builder(pcache('virtual-environments'))

local root = proot()
local py_venv = proot('python-venv')
local py_venv_bin = proot('python-venv', 'bin')
local py_venv_zip = proot('virtualenv.pyz')

local node_venv = proot('node-venv')
local node_venv_bin = proot('node-venv', 'bin')
local node_venv_zip = proot('python-venv', 'bin', 'nodeenv')

local lua_venv = proot('lua-venv')
local lua_venv_bin = proot('lua-venv', 'bin')

-- executables
local pip3 = proot('python-venv', 'bin', 'pip3')
local nodeenv = proot('python-venv', 'bin', 'nodeenv')
local hererocks = proot('python-venv', 'bin', 'hererocks')
local node = proot('node-venv', 'bin', 'node')

local s = vim.fn.system

local function nf(path, callback)
	if vim.fn.filereadable(path) == 0 then
		callback()
	end
end

local function nd(path, callback)
	if vim.fn.isdirectory(path) == 0 then
		callback()
	end
end

local function info(message)
	vim.notify(message, vim.log.levels.INFO)
end

nd(root, function()
	info('Creating package path: ' .. root)
	vim.fn.mkdir(root)
end)

nf(py_venv_zip, function()
	info('Installing virtualenv')
	s({
		'curl',
		'https://bootstrap.pypa.io/virtualenv.pyz',
		'--output',
		py_venv_zip,
	})
end)

nd(py_venv_bin, function()
	info('Creating python virtual environment')
	s({ 'python3', py_venv_zip, py_venv })
end)

nf(node_venv_zip, function()
	info('Installing nodeenv')
	s({ pip3, 'install', 'nodeenv' })
end)

nf(node, function()
	info('Creating nodejs virtual environment')
	s({ nodeenv, node_venv })
end)

nf(hererocks, function()
	info('Installing hererocks')
	s({ pip3, 'install', 'hererocks' })
end)

nd(lua_venv, function()
	info('Creating lua virtual environment')
	s({
		hererocks,
		lua_venv,
		'-l',
		'5',
		'-r',
		'latest',
		'--no-readline',
	})
end)

vim.env.PATH = py_venv_bin .. ':' .. vim.env.PATH
vim.env.PATH = node_venv_bin .. ':' .. vim.env.PATH
vim.env.PATH = lua_venv_bin .. ':' .. vim.env.PATH
