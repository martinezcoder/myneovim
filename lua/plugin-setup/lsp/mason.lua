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

local status_ok_2, lspconfig = pcall(require, "lspconfig")
if not status_ok_2 then
    return
end

lspconfig.solargraph.setup({
  settings = {
    solargraph = {
      rubocop = true
    }
  }
})

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

mason.setup(settings)
mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

-- loop through the servers
for _, server in pairs(servers) do
  opts = {
     -- getting "on_attach" and capabilities from handlers
    on_attach = require("plugin-setup.lsp.handlers").on_attach,
    capabilities = require("plugin-setup.lsp.handlers").capabilities,
  }

  -- get thet server name
  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "plugin-setup.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  -- pass server to lspconfig
  lspconfig[server].setup(opts)
end
