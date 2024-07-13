local function motion(key, motion_type)
	motion_type = motion_type or key

	return {
		key,
		function()
			require('spider').motion(motion_type)
		end,
		mode = { 'n', 'o', 'x' },
	}
end

return {
	'chrisgrieser/nvim-spider',
	keys = {
		motion('w'),
		motion('l', 'e'),
		motion('b'),
		-- { 'cw', 'ce' },
		-- { 'dw', 'de' },
	},
	opts = {
		subwordMovement = false,
	},
}
