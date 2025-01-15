---@class Parser
local M = {}

function M:new()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

---Parse a syntax tree from string
---@param str string
---@return any
function M.parse(str)
	local parser = vim.treesitter.get_string_parser(str, 'typescript', {})
	local root = parser:parse()[1]:root()

	local result_obj = {}

	local text = function(node)
		return vim.treesitter.get_node_text(node, str)
	end

	local build_obj
	---comment
	---@param node TSNode
	---@param result table
	---@return string
	build_obj = function(node, result)
		for child in node:iter_children() do
			if not child:named() then
				goto continue
			end

			local type = child:type()

			if type == 'array_type' then
				local val = {
					type = 'array',
					value = {},
				}
				table.insert(result, val)
				build_obj(child, val.value)
			elseif type == 'object_type' then
				local val = {
					type = 'object',
					value = {},
				}
				table.insert(result, val)
				build_obj(child, val.value)
			elseif type == 'property_signature' then
				local key = text(child:named_child(0))
				local value_node = child:named_child(1):named_child(0)

				if not value_node then
					goto continue
				end

				if
					value_node:type() == 'predefined_type'
					or value_node:type() == 'union_type'
				then
					table.insert(result, {
						name = key,
						type = text(value_node),
					})
				else
					local val = {
						type = 'unknown',
						value = {},
					}
					table.insert(result, val)
					build_obj(value_node, val.value)
				end
			elseif child:child_count() > 0 then
				build_obj(child, result)
			end

			::continue::
		end
	end

	local type_node = root:named_child(0)

	if not type_node then
		return result_obj
	end

	build_obj(type_node, result_obj)

	return result_obj
end

return M
