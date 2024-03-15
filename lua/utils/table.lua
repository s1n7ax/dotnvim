local M = {}

function M.concat(...)
	local new_tbl = {}

	for _, tbl in ipairs({ ... }) do
		for _, value in ipairs(tbl) do
			table.insert(new_tbl, value)
		end
	end

	return new_tbl
end

return M
