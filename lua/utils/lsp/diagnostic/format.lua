local unload = require('utils.module').unload_package
local Stringify = require('utils.lsp.diagnostic.ts.stringify')
local Parser = require('utils.lsp.diagnostic.ts.parser')

local ddd = {
	bufnr = 4,
	code = 2322,
	col = 2,
	end_col = 8,
	end_lnum = 112,
	lnum = 112,
	message = "Type 'Pagination<{ id: number; updatedAt: string; }>' is not assignable to type 'Pagination<{ id: number; updatedAt: string; }[]>'.\n  Type '{ id: number; updatedAt: string; }' is missing the following properties from type '{ id: number; updatedAt: string; }[]': length, pop, push, concat, and 35 more.",
	namespace = 32,
	severity = 1,
	source = 'ts',
}

unload('utils.lsp.diagnostic.ts.formatters.formatter1')
unload('utils.lsp.diagnostic.ts.formatters.formatter2')

local formatters = {
	require('utils.lsp.diagnostic.ts.formatters.formatter1'):new({
		stringify = Stringify:new(),
		parser = Parser:new(),
	}),

	require('utils.lsp.diagnostic.ts.formatters.formatter2'):new({
		stringify = Stringify:new(),
		parser = Parser:new(),
	}),
}

---comment
---@param diagnostic vim.Diagnostic
local format_diagnostics = function(diagnostic)
	local message = diagnostic.message

	if diagnostic.source == 'ts' and diagnostic.code == 2322 then
		for _, formatter in ipairs(formatters) do
			local match = message:match(formatter.pattern)

			if match then
				local ok, result = pcall(function()
					return formatter:format(message)
				end)

				if ok then
					return result
				end

				return message
			end
		end
	else
		return message
	end
end

return format_diagnostics
