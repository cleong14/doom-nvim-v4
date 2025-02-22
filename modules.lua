-- modules.lua - Doom nvim module selection
--
-- modules.lua controls what Doom nvim plugins modules are enabled and
-- what features are being used.
--
-- Uncomment a plugin to enable it and comment out to disable and uninstall it.
-- Once done, restart doom-nvim and run `:PackerInstall`.

return {
  features = {
    -- Language features
    "annotations", -- Code annotation generator
    "auto_install", -- Auto install LSP providers
    "autopairs", -- Automatically close character pairs  -- OK:
    "comment", -- Adds keybinds to comment in any language  -- OK:
    "linter", -- Linting and formatting for languages  -- TODO:
    "lsp", -- Code completion -- TODO:
    "extra_snippets", -- Code snippets for all languages -- TODO:

    -- Editor
    "auto_session", -- Remember sessions between loads  -- OK:
    "colorizer", -- Show colors in neovim
    "editorconfig", -- Support editorconfig files
    "gitsigns", -- Show git changes in sidebar  -- OK:
    "illuminate", -- Highlight other copies of the word you're hovering on  -- OK:
    "indentlines", -- Show indent lines with special characters  -- OK:
    "range_highlight", -- Highlight selected range from commands
    "todo_comments", -- Highlight TODO: comments
    -- "doom_themes",     -- Extra themes for doom  -- TBD:

    -- UI Components
    "lsp_progress", -- Check status of LSP loading
    "tabline", -- Tab bar buffer switcher  -- OK:
    "dashboard", -- A pretty dashboard upon opening  -- OK:
    -- "trouble",         -- A pretty diagnostic viewer
    "statusline", -- A pretty status line at the bottom of the buffer  -- TBD:
    -- "minimap",         -- Shows current position in document
    -- "terminal",        -- Integrated terminal in neovim
    -- "symbols",         -- Navigate between code symbols using telescope -- TODO:
    -- "ranger",          -- File explorer in neovim (TODO: Test) -- OK:
    -- "restclient",      -- Test HTTP requests from neovim (TODO: Test)
    -- "show_registers",  -- Show and navigate between registers  -- TBD:

    -- Tools
    -- "dap",             -- Debug code through neovim -- TBD:
    "repl", -- Interactive REPL in neovim  -- OK:
    -- "explorer", -- An enhanced filetree explorer  -- TBD:
    "neo_tree", -- Neovim plugin to manage the file system and other tree like structures  -- OK:
    -- "firenvim",        -- Embed neovim in your browser
    -- "lazygit",         -- Lazy git integration -- OK:
    -- "neogit",          -- A git client for neovim
    "neorg", -- Organise your life  -- OK:
    "projects", -- Quickly switch between projects
    -- "superman",        -- Read unix man pages in neovim
    -- "suda",            -- Save using sudo when necessary
    "telescope", -- Fuzzy searcher to find files, grep code and more -- WIP:
    "whichkey", -- An interactive sheet
  },
  langs = {
    -- Scripts
    "lua",
    "python",
    -- "bash",
    -- "fish",

    -- Web
    -- "javascript",
    -- "typescript",
    -- "css",
    -- "vue",
    -- "tailwindcss",

    -- Compiled
    -- "rust",
    -- "cc",
    -- "ocaml",

    -- JIT
    -- "c_sharp",
    -- "kotlin",
    -- "java",

    -- "config",          -- JSON, YAML, TOML
    -- "markdown",
    -- "terraform",       -- Terraform / hcl files support
    -- "dockerfile",
  },
}

-- vim: sw=2 sts=2 ts=2 fdm=indent expandtab
