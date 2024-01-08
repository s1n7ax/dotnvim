local Spacer = { provider = ' ' }
local function rpad(child)
	return {
		condition = child.condition,
		child,
		Spacer,
	}
end
local function OverseerTasksForStatus(status)
	return {
		condition = function(self)
			return self.tasks[status]
		end,
		provider = function(self)
			return string.format(
				'%s%d',
				self.symbols[status],
				#self.tasks[status]
			)
		end,
		hl = function(self)
			return {
				-- fg = utils.get_highlight(string.format('Overseer%s', status)).fg,
				fg = 'white',
			}
		end,
	}
end

return {
	condition = function()
		return package.loaded.overseer
	end,
	init = function(self)
		local tasks =
			require('overseer.task_list').list_tasks({ unique = true })
		local tasks_by_status =
			require('overseer.util').tbl_group_by(tasks, 'status')
		self.tasks = tasks_by_status
	end,
	static = {
		symbols = {
			['CANCELED'] = ' ',
			['FAILURE'] = '󰅚 ',
			['SUCCESS'] = '󰄴 ',
			['RUNNING'] = '󰑮 ',
		},
	},

	rpad(OverseerTasksForStatus('CANCELED')),
	rpad(OverseerTasksForStatus('RUNNING')),
	rpad(OverseerTasksForStatus('SUCCESS')),
	rpad(OverseerTasksForStatus('FAILURE')),
}
