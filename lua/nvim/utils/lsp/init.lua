local lsp_config = require('lspconfig')
local Configurer = require('nvim.utils.lsp.config')
local LspEvent = require('nvim.utils.lsp.event')
local Event = require('nvim.utils.event')

local M = {
	lsp_event = Event:new(),
}

--- Add event listener
--
-- @param { Event } event - event type
-- @param { Function } listener - callback function to call on event
function M.add_listener(event, listener)
	M.lsp_event:add_listener(event, listener)
end

--- Setup language servers
function M.setup(servers)
	M.lsp_event:dispatch(LspEvent.START)

	for _, server_name in pairs(servers) do
		local configurer = Configurer:new()

		M.lsp_event:dispatch(LspEvent.SERVER_SETUP, server_name, configurer)

		-- user can choose to prevent the setup process using
		-- conf.set_prevent_setup(true)
		if not configurer.prevent_setup then
			lsp_config[server_name].setup(configurer:get_config())
		end

		M.lsp_event:dispatch(LspEvent.SERVER_SETUP_END, server_name, configurer)
	end

	M.lsp_event:dispatch(LspEvent.END)
end

function M.get_client_name(event)
	local client_id = event.data.client_id
	local client = vim.lsp.get_client_by_id(client_id)

	return client.name
end

function M.get_client(event)
	local client_id = event.data.client_id
	local client = vim.lsp.get_client_by_id(client_id)

	return client
end

return M
