local M = {}

function M.get_client(event)
  local client_id = event.data.client_id
  local client = vim.lsp.get_client_by_id(client_id)

  return client
end

return M
