---@class Stringify
local M = {}

function M:new()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function M.stringify(tbl)
	local function parse_value(value)
		if value.type == 'object' then
			local fields = {}
			for _, field in ipairs(value.value) do
				table.insert(fields, string.format('  %s: %s', field.name, field.type))
			end
			return string.format('{\n%s\n}', table.concat(fields, ',\n'))
		elseif value.type == 'array' then
			return string.format('Array<%s>', parse_value(value.value[1]))
		else
			return value.type
		end
	end

	return parse_value(tbl)
end

return M
