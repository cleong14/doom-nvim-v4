local projects = {}

projects.settings ={
  -- Manual mode doesn't automatically change your root directory, so you have
  -- the option to manually do so using `:ProjectRoot` command.
  manual_mode = false,

  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
  -- order matters: if one is not detected, the other is used as fallback. You
  -- can also delete or rearangne the detection methods.
  detection_methods = { "lsp", "pattern" },

  -- All the patterns used to detect root dir, when **"pattern"** is in
  -- detection_methods
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

  -- Table of lsp clients to ignore by name
  -- eg: { "efm", ... }
  ignore_lsp = {},

  -- Don't calculate root dir on specific directories
  -- Ex: { "~/.cargo/*", ... }
  exclude_dirs = {},

  -- Show hidden files in telescope
  show_hidden = false,

  -- When set to false, you will get a message when project.nvim changes your
  -- directory.
  silent_chdir = true,

  -- Path where project.nvim will store the project history for use in
  -- telescope
  datapath = vim.fn.stdpath("data"),
}

projects.uses = {
  ["project.nvim"] = {
    "ahmedkhalf/project.nvim",
    commit = "cef52b8da07648b750d7f1e8fb93f12cb9482988",
    requires = { "nvim-treesitter/nvim-treesitter" },
  },
}

projects.configs = {}
projects.configs["project.nvim"] = function()
  require("project_nvim").setup(doom.modules.projects.settings)

  table.insert(doom.modules.telescope.settings.extensions, 'projects')
end

projects.binds = {
  { '<leader>fp', '<cmd>Telescope projects<CR>', name = 'Switch project' }
}

return projects
