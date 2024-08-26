local M = {}

function M.find(tbl, finder)
	for _, v in ipairs(tbl) do
		if finder(v) then
			return v
		end
	end

	return nil
end

return M
