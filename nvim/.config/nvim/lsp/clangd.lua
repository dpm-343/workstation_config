return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy", -- Activates clang-tidy checks natively
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  init_options = {
    fallbackFlags = { "-std=c++20" },
  },
}

