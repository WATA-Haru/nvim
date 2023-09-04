-- https://github.com/yuucu/dotfiles/pull/2/files
return {
  'williamboman/mason.nvim',
  dependencies = {'williamboman/mason-lspconfig.nvim',},
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
    "MasonUpdate",      -- AstroNvim extension here as well
    "MasonUpdateAll",   -- AstroNvim specific
  },
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_uninstalled = "✗",
        package_pending = "⟳",
      },
    },
  },
  build = ":MasonUpdate",
}
