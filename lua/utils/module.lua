local M = {}

function M.unload_package(package_name)
  for module_name, _ in pairs(package.loaded) do
    if string.find(module_name, '^' .. package_name) then
      package.loaded[module_name] = nil
    end
  end
end

function M.reload_package(package_name)
  local removed_pkgs = {}

  for module_name, _ in pairs(package.loaded) do
    if vim.startswith(module_name, package_name) then
      table.insert(removed_pkgs, module_name)
      package.loaded[module_name] = nil
    end
  end

  for _, module_name in ipairs(removed_pkgs) do
    require(module_name)
  end
end

return M
