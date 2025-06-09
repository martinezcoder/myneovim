-- protected calls
local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
    return
end

local servers = {
  "bashls",
  "cssls",
  "cssmodules_ls",
  "dockerls",
  "emmet_ls",
  "graphql",
  "html",
  "lua_ls",
  "jsonls",
  "pyright",
  "solargraph",
  "tailwindcss",
  "ts_ls",
  "vimls",
  "yamlls",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

-- Setup Mason and Mason LSPConfig
mason.setup(settings)

mason_lspconfig.setup {
  ensure_installed = servers,
 --   automatic_enable = false,
}

-- Setup individual LSP servers
local status_ok_2, lspconfig = pcall(require, "lspconfig")
if not status_ok_2 then
    return
end

-- Configuración específica para solargraph
lspconfig.solargraph.setup({
  cmd = { "bundle", "exec", "solargraph", "stdio" },
  settings = {
    solargraph = {
      rubocop = true,
    },
  },
})

-- Configuración genérica para los demás servidores
for _, server in pairs(servers) do
  local opts = {
    on_attach = require("plugin-setup.lsp.handlers").on_attach,
    capabilities = require("plugin-setup.lsp.handlers").capabilities,
  }

  -- Elimina versiones si vienen tipo "tsserver@1.2.3"
  server = vim.split(server, "@")[1]

  -- Si hay configuración específica, la combina
  local has_custom_opts, server_opts = pcall(require, "plugin-setup.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  -- Configura el servidor
  lspconfig[server].setup(opts)
end

