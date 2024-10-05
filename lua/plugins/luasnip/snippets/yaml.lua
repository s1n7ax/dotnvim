local M = {}

function M.setup()
	local ls = require('luasnip')
	local kubernetes = require('snips.kubernetes')

	local s = ls.s

	ls.add_snippets('yaml', {
		s('pod', kubernetes.primitives.pod()),
		s('rs', kubernetes.primitives.replicaset()),
		s('dep', kubernetes.primitives.deployment()),
		s('ser', kubernetes.primitives.service()),
		s('sec', kubernetes.primitives.secret()),
	})
end

return M
