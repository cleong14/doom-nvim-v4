-- doom_modules - Doom nvim module selection
--
-- The doom_modules controls what Doom nvim plugins modules are enabled and
-- what features are being used.
--
-- Comment out a plugin to enable it and comment a non-commented one to
-- disable and uninstall it.
--
-- NOTE: you can open the Doom nvim documentation by pressing `SPC d h`. You
-- will find a table of content where you will see a "Doomrc" section under the
-- "Configuration" one. In that section you will find a comprehensive list of
-- the available modules and all their supported flags.

local M = {}

M.source = debug.getinfo(1, "S").source:sub(2)

M.modules = {
  ui = {
    "dashboard",                  -- Start screen  -- OK:
    -- "doom-themes",                -- Additional doom emacs' colorschemes  -- TBD:
    "indentlines",                -- Show indent lines  -- OK:
    -- "show_registers",             -- popup that shows register contents  -- TBD:
    "statusline",                 -- Statusline  -- TBD:
    "tabline",                    -- Tabline, shows your buffers list at top  -- OK:
    "which-key",                  -- Keybindings popup menu like Emacs' guide-key
    -- "zen",                        -- Distraction free environment
    "illuminated",                -- Highlight other uses of the word under the cursor like VSC  -- OK:
  },
  doom = {
    "compiler",                   -- Compile (and run) your code with just pressing three keys!  -- TBD:
    -- "contrib",                    -- Special plugins intended for Doom Nvim contributors (lua docs, etc)  -- TBD:
    "neorg",                      -- Life Organization Tool, used by Doom Nvim user manual  -- OK:
    "runner",                     -- Open a REPL for the current language or run the current file  -- TBD:
  },
  editor = {
    "autopairs",                  -- autopairs for neovim written by lua  -- OK:
    "auto-session",               -- A small automated session manager for Neovim  -- OK:
    "dap",                        -- Debug Adapter Protocol -- TBD:
    "editorconfig",               -- EditorConfig support for Neovim
    -- "explorer",                   -- Tree explorer  -- TBD:
    "neo-tree",                   -- Neovim plugin to manage the file system and other tree like structures.  -- OK:
    -- "neo-tree-diagnostics",       -- A diagnostics source for neo-tree.nvim
    "formatter",                  -- File formatting
    "gitsigns",                   -- Git signs  -- OK:
    "git-conflict",               -- A plugin to visualise and resolve merge conflicts in neovim  -- TODO:
    -- "kommentary",                 -- Comments plugin
    "comment",                    -- Smart and Powerful commenting plugin for neovim  -- OK:
    "linter",                     -- Asynchronous linter, see errors in your code on the fly  -- TODO:
    -- "lsp",                        -- Language Server Protocols
    "marks",                      -- A better user experience for interacting with and manipulating Vim marks.
    "my-lsp",                     -- My Language Server Protocols -- TODO:
    "minimap",                    -- Code minimap, requires github.com/wfxr/code-minimap
    "ranger",                     -- Ranger File Browser, requires ranger file browser -- OK:
    -- "floating_ranger",            -- Ranger File Browser, requires ranger file browser
    -- "nnn",                        -- File manager for Neovim powered by nnn.
    "snippets",                   -- Code snippets -- TODO:
    -- "snippet_converter",          -- Bundle snippets from multiple sources and convert them to your format of choice.
    -- "friendly-snippets",          -- Set of preconfigured snippets for different languages.
    -- "luasnip",                    -- Snippet Engine for Neovim written in Lua.
    "symbols",                    -- LSP symbols and tags -- TODO:
    "telescope",                  -- Highly extendable fuzzy finder over lists -- TODO:
    "terminal",                   -- Terminal for Neovim (NOTE: needed for runner and compiler) -- TODO:
    "trouble",                    -- A pretty list to help you solve all the trouble your code is causing. -- TODO:
    "comment-box",                -- ✨ Clarify and beautify your comments using boxes and lines. -- TODO:
    "yaml-companion",             -- Get, set and autodetect YAML schemas in your buffers. -- TODO:
    "yaml-toolkit",               -- 🍒 YAML toolkit for Neovim users -- TODO:
  },
  langs = { -- TODO:
    -- WARNING: LSP Servers installed via `LspInstall`; Use `nvim-lsp-installer` instead in `init.lua`
    -- To enable the language server for a language just add the +lsp flag
    -- at the end, e.g. 'rust +lsp'. This will install the rust TreeSitter
    -- parser and rust-analyzer
    --
    "css",                        -- CSS support
    "html",                       -- HTML support
    "javascript",                 -- JavaScript support
    "typescript",                 -- TypeScript support

    "bash",                       -- The terminal gods language
    -- "elixir",                     -- Build scalable and maintainable software
    "lua",                        -- Support for our gods language
    "python",                     -- Python support + lsp
    "ruby",                       -- Look ma, I love the gems!

    "c",                          -- Core dumped: segmentation fault
    "cpp",                        -- C++ support
    "go",                         -- Hello, gopher
    -- "haskell",                    -- Because Functional programming is fun, isn't it?
    "java",                       -- Java support
    "rust",                       -- Let's get rusty!
    "scala",                      -- Java, but good

    "comment",                    -- Better annotations and comments
    "config",                     -- Configuration files (JSON, YAML, TOML)
    "dockerfile",                 -- Do you like containers, right?
  },
  utilities = {
    "lazygit",                    -- LazyGit integration for Neovim, requires LazyGit -- OK:
    "neogit",                     -- Magit for Neovim -- TODO:
    "range-highlight",            -- Hightlights ranges you have entered in commandline -- TODO:
    "suda",                       -- Write and read files without sudo permissions -- TODO:
    "superman",                   -- Read Unix man pages faster than a speeding bullet! -- TODO:
    "todo_comments",              -- Highlight, list and search todo comments in your projects -- TODO:
    ------------------
    -- My Utilities               -- My additional utility plugins
    ------------------
    "tmux_navigator",             -- Smoothly navigate between splits and panes -- TODO:
    "focus",                      -- Auto-Resizing Focused Splits/Windows for Neovim -- TODO:
    "highstr",                    -- A NeoVim plugin for highlighting visual selections like in a normal document editor -- TODO:
    "diffview",                   -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev -- TODO:
    "hop",                        -- Neovim motions on speed! -- TODO:
    "neoclip",                    -- Clipboard manager neovim plugin with telescope integration -- TODO:
    "nvim-lightbulb",             -- VSCode bulb for neovim's built-in LSP -- TODO:
    "nvim-code-action-menu",      -- Pop-up menu for code actions to show meta-information and diff preview -- TODO:
    "neogen",                     -- A better annotation generator -- TODO:
    "faster",                     -- A neovim plugin to accelerate j or k moving. -- TODO:
    "better-escape",              -- Escape from insert mode without delay when typing -- TODO:
    "hlslens",                    -- Hlsearch Lens for Neovim -- TODO:
    "scrollbar",                  -- Extensible Neovim Scrollbar -- TODO:
    "dressing",                   -- Neovim plugin to improve the default vim.ui interfaces. -- TODO:
    "mind",                       -- The power of trees at your fingertips. -- TODO:
    "venn",                       -- Draw ASCII diagrams in Neovim -- TODO:
    -- "impatient",                  -- Improve startup time for Neovim
    "image",                      -- Image Viewer as ASCII Art for Neovim, written in Lua -- TODO:
    -- "legendary",                  -- A legend for your keymaps, commands, and autocmds, with which-key.nvim integration (requires Neovim nightly).
    ------------------
    -- My Telescope               -- My additional utility plugins
    ------------------
    "frecency",                   -- intelligent prioritization when selecting files from your editing history -- TODO:
    ------------------
    -- My LSPs                    -- My additional utility plugins
    ------------------
    -- "nvim-lsp-installer",         -- Companion plugin for nvim-lspconfig that allows you to seamlessly manage LSP servers locally with :LspInstall
    "mason",                      -- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters. -- TODO:
    "null-ls",                    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua -- TODO:
    "lsp-zero",                   -- A starting point to setup some lsp related features in neovim. -- TODO:
    ------------------
    -- My CMP Sources             -- My additional nvim-cmp plugins
    ------------------
    "nvim-cmp",                   -- A completion plugin for neovim coded in Lua. -- TODO:
    "cmdline",                    -- nvim-cmp source for vim's cmdline -- TODO:
    -- "treesitter",                 -- cmp source for treesitter
    "cmp_luasnip",                -- luasnip completion source for nvim-cmp -- TODO:
    -- "cmp-vim-lsp",                -- Integration between hrsh7th/nvim-cmp and prabirshrestha/vim-lsp
    -- "tags",                       -- tags completion source for nvim-cmp
    "signature-help",             -- nvim-cmp source for vim's cmdline -- TODO:
    "document-symbol",            -- nvim-cmp source for textDocument/documentSymbol via nvim-lsp -- TODO:
    -- "look",                       -- display lines beginning with a given string
    "spell",                      -- spell source for nvim-cmp based on vim's spellsuggest -- TODO:
    "dictionary",                 -- Dictionary completion source for nvim-cmp -- TODO:
    "rg",                         -- ripgrep source for nvim-cmp -- TODO:
    -- "tabnine",                    -- TabNine plugin for hrsh7th/nvim-cmp
  },
  web = {
    "colorizer",                  -- Fastest colorizer for Neovim -- TODO:
    -- "firenvim",                   -- Requires firenvim browser extension; change fontsize by increasing guifontsize in doom_config
    "restclient",                 -- A fast Neovim http client -- TODO:
  },
}

return M

-- vim: sw=2 sts=2 ts=2 fdm=indent expandtab
