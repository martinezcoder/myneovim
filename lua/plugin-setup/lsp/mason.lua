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
  automatic_installation = true,
  handlers = {
    ["ruby_lsp"] = function() end,
  },
}

-- Setup individual LSP servers
local status_ok_2, lspconfig = pcall(require, "lspconfig")
if not status_ok_2 then
    return
end

-- Generic configuration for all servers
for _, server in pairs(servers) do
  local opts = {
    on_attach = require("plugin-setup.lsp.handlers").on_attach,
    capabilities = require("plugin-setup.lsp.handlers").capabilities,
  }

  -- Delete versions if they are of type "tsserver@1.2.3"
  server = vim.split(server, "@")[1]

  -- Combines with specific configuration if a lua file exists for the server
  local has_custom_opts, server_opts = pcall(require, "plugin-setup.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  -- Configures the server
  lspconfig[server].setup(opts)
end
