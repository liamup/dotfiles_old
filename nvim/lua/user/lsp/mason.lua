local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason.nvim not found!")
  return
end

-- NOTE: 如果发现某些lsp server安装启动时出现， client exit x and signal 0 等错误
-- 可能是因为node版本过低， 升级node版本即可
-- 升级方法
-- npm cache clean -f
-- npm install -g n
-- n stable

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
