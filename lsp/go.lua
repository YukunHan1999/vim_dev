-- lua/lsp/go.lua
---@type vim.lsp.Config
return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,   -- 提示未使用的参数
        shadow = true,         -- 提示变量覆盖
      },
      staticcheck = true,      -- 开启静态检查
      gofumpt = true,          -- 使用更严格的 gofumpt 格式化
      -- 0.12 核心体验：内联提示 (Inlay Hints)
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      completeUnimported = true, -- 自动补全未导入的包
      usePlaceholders = true,    -- 补全函数时带上参数占位符
    },
  },
}