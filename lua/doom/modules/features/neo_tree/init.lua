-- https://github.com/nvim-neo-tree/neo-tree.nvim
local neo_tree = {}

-- neo_tree.settings = {
--   disable_netrw = true,
--   hijack_netrw = true,
--   open_on_setup = false,
--   ignore_ft_on_setup = {},
--   open_on_tab = true,
--   hijack_cursor = true,
--   update_cwd = true,
--   respect_buf_cwd = true,
--   update_focused_file = {
--     enable = true,
--     update_cwd = true,
--     ignore_list = {},
--   },
--   view = {
--     width = 35,
--     side = "left",
--     mappings = {
--       custom_only = false,
--     },
--   },
--   filters = {
--     custom = { ".git", "node_modules.editor", ".cache", "__pycache__" },
--   },
--   renderer = {
--     indent_markers = {
--       enable = true,
--     },
--     highlight_git = true,
--     root_folder_modifier = ":~",
--     add_trailing = true,
--     group_empty = true,
--     special_files = {
--       "README.md",
--       "Makefile",
--       "MAKEFILE",
--     },
--     icons = {
--       glyphs = {
--         default = "",
--         symlink = "",
--         folder = {
--           arrow_open = "",
--           arrow_closed = "",
--           default = "",
--           open = "",
--           empty = "",
--           empty_open = "",
--           symlink = "",
--           symlink_open = "",
--         },
--         git = {
--           unstaged = "",
--           staged = "",
--           unmerged = "",
--           renamed = "",
--           untracked = "",
--           deleted = "",
--           ignored = "◌",
--         },
--       },
--       show = {
--         git = true,
--         folder = true,
--         file = true,
--         folder_arrow = true,
--       },
--     },
--   },
--   actions = {
--     open_file = {
--       resize_window = true, -- previously view.auto_resize
--       window_picker = {
--         exclude = {
--           filetype = {
--             "notify",
--             "packer",
--             "qf",
--           },
--           buftype = {
--             "terminal",
--           },
--         },
--       },
--     },
--   },
--   diagnostics = {
--     enable = false,
--   },
-- }

neo_tree.packages = {
  ["neo-tree.nvim"] = {
    "nvim-neo-tree/neo-tree.nvim",
    -- commit = "a917174b38b065b5fc01c89709cfc31fbe6917db",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim"
    },
  },
}

neo_tree.configs = {}
neo_tree.configs["neo-tree.nvim"] = function()
  -- Unless you are still migrating, remove the deprecated commands from v1.x
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  -- If you want icons for diagnostic errors, you'll need to define them somewhere:
  vim.fn.sign_define("DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn",
    { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo",
    { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint" })
  -- NOTE: this is changed from v1.x, which used the old style of highlight groups
  -- in the form "LspDiagnosticsSignWarning"

  require("neo-tree").setup({
    -- sources = {
    --   "filesystem",
    --   "buffers",
    --   "git_status",
    --   "diagnostics",
    --   -- ...and any additional source
    -- },
    -- -- These are the defaults
    -- diagnostics = {
    --   bind_to_cwd = true,
    --   diag_sort_function = "severity", -- "severity" means diagnostic items are sorted by severity in addition to their positions.
    --                                    -- "position" means diagnostic items are sorted strictly by their positions.
    --                                    -- May also be a function.
    --   follow_behavior = { -- Behavior when `follow_current_file` is true
    --     always_focus_file = false, -- Focus the followed file, even when focus is currently on a diagnostic item belonging to that file.
    --     expand_followed = true, -- Ensure the node of the followed file is expanded
    --     collapse_others = true, -- Ensure other nodes are collapsed
    --   },
    --   follow_current_file = true,
    --   group_dirs_and_files = true, -- when true, empty folders and files will be grouped together
    --   group_empty_dirs = true, -- when true, empty directories will be grouped together
    --   show_unloaded = true, -- show diagnostics from unloaded buffers
    -- },
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    close_floats_on_escape_key = true,
    default_source = "filesystem",
    enable_diagnostics = true,
    enable_git_status = true,
    enable_modified_markers = true, -- Show markers for files with unsaved changes.
    enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
    git_status_async = true,
    -- These options are for people with VERY large git repos
    git_status_async_options = {
      batch_size = 1000, -- how many lines of git status results to process at a time
      batch_delay = 10, -- delay in ms between batches. Spreads out the workload to let other processes run.
      max_lines = 10000, -- How many lines of git status results to process. Anything after this will be dropped.
      -- Anything before this will be used. The last items to be processed are the untracked files.
    },
    -- log_level = "error", -- "trace", "debug", "info", "warn", "error", "fatal"
    -- log_to_file = false, -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
    open_files_in_last_window = true, -- false = open files in top left window
    popup_border_style = "rounded",
    resize_timer_interval = 500, -- in ms, needed for containers to redraw right aligned and faded content
    -- set to -1 to disable the resize timer entirely
    --                           -- NOTE: this will speed up to 50 ms for 1 second following a resize
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    use_popups_for_input = true, -- If false, inputs will use vim.ui.input() instead of custom floats.
    use_default_mappings = false,
    default_component_configs = {
      container = {
        enable_character_fade = true
      },
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        -- expander config, needed for nesting files
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "ﰊ",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "*",
        highlight = "NeoTreeFileIcon"
      },
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        hightlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "✚",
          modified  = "",
          deleted   = "✖",
          renamed   = "",
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "",
          staged    = "",
          conflict  = "",
        },
        align = "right",
      },
    },
    renderers = {
      directory = {
        { "indent" },
        { "icon" },
        { "current_filter" },
        {
          "container",
          width = "100%",
          right_padding = 1,
          --max_width = 60,
          content = {
            { "name", zindex = 10 },
            {
              "symlink_target",
              zindex = 10,
              highlight = "NeoTreeSymbolicLinkTarget",
            },
            { "clipboard", zindex = 10 },
            { "diagnostics", errors_only = true, zindex = 20, align = "right" },
          },
        },
      },
      file = {
        { "indent" },
        { "icon" },
        {
          "container",
          width = "100%",
          right_padding = 1,
          --max_width = 60,
          content = {
            {
              "name",
              use_git_status_colors = true,
              zindex = 10
            },
            {
              "symlink_target",
              zindex = 10,
              highlight = "NeoTreeSymbolicLinkTarget",
            },
            { "clipboard", zindex = 10 },
            { "bufnr", zindex = 10 },
            { "modified", zindex = 20, align = "right" },
            { "diagnostics", zindex = 20, align = "right" },
            { "git_status", zindex = 20, align = "right" },
          },
        },
      },
      message = {
        { "indent", with_markers = false },
        { "name", highlight = "NeoTreeMessage" },
      },
      terminal = {
        { "indent" },
        { "icon" },
        { "name" },
        { "bufnr" }
      }
    },
    nesting_rules = {},
    window = {
      position = "right",
      width = 60,
      popup = { -- settings that apply to float position only
        size = {
          height = "80%",
          width = "50%",
        },
        position = "50%", -- 50% means center it
        -- you can also specify border here, if you want a different setting from
        -- the global popup_border_style.
      },
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      -- global mappings
      mappings = {
        ["w"] = "open",
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["-"] = "open_split",
        ["_"] = "open_vsplit",
        ["t"] = "open_tabnew",
        ["z"] = "close_all_nodes",
        ["R"] = "refresh",
        ["h"] = "close_node",
        ["J"] = "set_root",
        ["K"] = "navigate_up",
        ["l"] = "open",
        ["."] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["f"] = "filter_on_submit",
        ["<bs>"] = "clear_filter",
        -- ["a"] = "add",
        ["a"] = {
          "add",
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            -- show_path = "none" -- "none", "relative", "absolute"
            show_path = "relative" -- "none", "relative", "absolute"
          }
        },
        -- ["A"] = "add_directory",
        ["A"] = {
          "add_directory",
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            -- show_path = "none" -- "none", "relative", "absolute"
            show_path = "relative" -- "none", "relative", "absolute"
          }
        },
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy", -- takes text input for destination
        ["m"] = "move", -- takes text input for destination
        ["q"] = "close_window",
        ["?"] = "show_help",
      }
    },
    filesystem = {
      window = {
        mappings = {
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
        }
      },
      async_directory_scan = "auto", -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
      -- "always" means directory scans are always async.
      -- "never"  means directory scans are never async.
      bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
      -- The renderer section provides the renderers that will be used to render the tree.
      --   The first level is the node type.
      --   For each node type, you can specify a list of components to render.
      --       Components are rendered in the order they are specified.
      --         The first field in each component is the name of the function to call.
      --         The rest of the fields are passed to the function as the "config" argument.
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
        show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "m",
          "hjkl",
          "arrow",
          "~",
          --"node_modules"
        },
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta"
        },
        never_show = { -- remains hidden even if visible is toggled to true
          --".DS_Store",
          --"thumbs.db"
        },
      },
      find_by_full_path_words = true, -- `false` means it only searches the tail of a path.
      -- `true` will change the filter into a full path
      -- search with space as an implicit ".*", so
      -- `fi init`
      -- will match: `./sources/filesystem/init.lua
      find_command = "fd", -- this is determined automatically, you probably don't need to set it
      -- find_args = {  -- you can specify extra args to pass to the find command.
      --   fd = {
      --     "--exclude", ".git",
      --     "--exclude",  "node_modules"
      --   }
      -- },
      ---- or use a function instead of list of strings
      find_args = function(cmd, path, search_term, args)
        if cmd ~= "fd" then
          return args
        end
        --maybe you want to force the filter to always include hidden files:
        table.insert(args, "--hidden")
        -- but no one ever wants to see .git files
        table.insert(args, "--exclude")
        table.insert(args, ".git")
        -- or node_modules
        table.insert(args, "--exclude")
        table.insert(args, "node_modules")
        -- here is where it pays to use the function, you can exclude more for
        -- short search terms, or vary based on the directory
        -- if string.len(search_term) < 4 and path == "/home/cseickel" then
        if string.len(search_term) < 4 and path == "/Users/cleong" then
          table.insert(args, "--exclude")
          table.insert(args, "Library")
        end
        return args
      end,
      group_empty_dirs = true, -- when true, empty folders will be grouped together
      search_limit = 50, -- max number of search results when using filters
      follow_current_file = true, -- This will find and focus the file in the active buffer every
      -- time the current file is changed while the tree is open.
      hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      -- in whatever position is specified in window.position
      -- "open_current",  -- netrw disabled, opening a directory opens within the
      -- window like netrw would, regardless of window.position
      -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
      use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
      -- instead of relying on nvim autocmd events.
    },
    buffers = {
      bind_to_cwd = true,
      follow_current_file = true, -- This will find and focus the file in the active buffer every
      -- time the current file is changed while the tree is open.
      group_empty_dirs = true, -- when true, empty folders will be grouped together
      show_unloaded = true,
      window = {
        mappings = {
          ["bd"] = "buffer_delete",
        }
      },
    },
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"]  = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        }
      }
    }
  })
  vim.cmd([[nnoremap <C-B> :Neotree toggle buffers float<cr>]])
  vim.cmd([[nnoremap <C-S> :Neotree toggle git_status float<cr>]])
end

neo_tree.binds = {
  -- { "<F3>", ":NvimTreeToggle<CR>", name = "Toggle file neo_tree" },
  -- { "<leader>e", ":Neotree toggle current right reveal_force_cwd<CR>", name = "Neotree toggle current right reveal_force_cwd" },
  { "<Bslash><Bslash>", ":Neotree toggle current float reveal_force_cwd<CR>", name = "Neotree toggle current float reveal_force_cwd" },
  {
    "<leader>",
    name = "+prefix",
    {
      -- {
      --   "o",
      --   name = "+open/close",
      --   {
      --     { "e", "<cmd>NvimTreeToggle<CR>", name = "neo_tree" },
      --   },
      -- },
      { "e", ":Neotree toggle current right reveal_force_cwd<CR>", name = "Neotree toggle current right reveal_force_cwd" },
      { "E", ":Neotree toggle current left reveal_force_cwd<CR>", name = "Neotree toggle current left reveal_force_cwd" },
    },
  },
}

-- neo_tree.autocmds = {
--   {
--     "BufEnter",
--     "*",
--     function()
--       local name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
--       if vim.fn.isdirectory(name) == 1 then
--         require("nvim-tree.api").tree.change_root(name)
--       end
--     end,
--   },
-- }

return neo_tree
