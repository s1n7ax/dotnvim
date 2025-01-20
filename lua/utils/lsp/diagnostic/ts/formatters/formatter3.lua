---@class Formatter2
---@field pattern string
---@field stringify Stringify
---@field parser Parser
local M = {}

function M:new(args)
	local o = {}
	setmetatable(o, self)
	self.__index = self

	o.pattern =
		".*Type '(.-)' is missing the following properties from type '(.-)'"
	o.stringify = args.stringify
	o.parser = args.parser

	return o
end

---formats diagnostic message
---@param message string
---@return string
function M:format(message)
	local clean_message = string.gsub(message, '\n', '')
	local org_type, exp_type = clean_message:match(self.pattern)

	org_type = 'type Org = ' .. org_type:gsub('%.%.%. %d+ more %.%.%.;%s+', '')
	exp_type = 'type Exp = ' .. exp_type:gsub('%.%.%. %d+ more %.%.%.;%s+', '')

	local actual = self.stringify.stringify(self.parser.parse(org_type)[1])
	local expected = self.stringify.stringify(self.parser.parse(exp_type)[1])

	return string.format(
		[[
Actual
%s

# Expected
%s
]],
		actual,
		expected
	)
end

return M
