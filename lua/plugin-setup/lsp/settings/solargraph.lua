print("SOLARGRAPH CONFIGURATION")
return {
  cmd = { "bundle", "exec", "solargraph", "stdio" },
  settings = {
    solargraph = {
      useBundler = true,
      rubocop    = true,
      diagnostics= true,
      formatting = true,
      completion = true,
    },
  },
}
