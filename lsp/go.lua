-- lsp/go.lua
-- 这里的结构严格遵循 Neovim 0.12 的 vim.lsp.Config 规范

---@type vim.lsp.Config
return {
  -- 启动命令（确保你已经通过 Mason 或 go install 安装了 gopls）
  cmd = { 'gopls' },
  
  -- 生效的文件类型
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  
  -- 项目根目录识别（0.12 的核心新特性，取代了旧的 root_dir 函数）
  root_markers = { 'go.work', 'go.mod', '.git' },
  
  -- Gopls 专属设置
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true, -- 使用更严格的格式化
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}