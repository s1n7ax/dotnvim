local function get_config(config)
	table.insert(config.document_config.default_config.filetypes, 'rust')
	return config
end

return get_config
