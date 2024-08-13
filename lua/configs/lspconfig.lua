local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

  
 
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- csharp
-- csharp using omnisharp
lspconfig.omnisharp.setup {
  cmd = { "dotnet", "/home/user/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll" },  -- Adjust the path to OmniSharp.dll
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "cs", "vb" },
  root_dir = lspconfig.util.root_pattern(".git", "*.sln"),
}
