-- https://github.com/budimanjojo/dotfiles/blob/master/dot_config/nvim/lua/configs/_autopairs.lua
local autopairs = {}

-- autopairs.settings = {
--   enable_afterquote = true,
--   enable_check_bracket_line = true,
--   enable_moveright = true,
-- }

autopairs.packages = {
  ["nvim-autopairs"] = {
    "windwp/nvim-autopairs",
    commit = "a7a8be3d2f2473300d070293903ac8b95edeccc1",
    event = "BufReadPost",
  },
}

autopairs.configs = {}
autopairs.configs["nvim-autopairs"] = function()
  -- require("nvim-autopairs").setup(
  --   vim.tbl_deep_extend("force", doom.features.autopairs.settings, { check_ts = true })
  -- )
  local npairs = require('nvim-autopairs')
  local Rule = require('nvim-autopairs.rule')
  local ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", "")

  npairs.setup({
    -- defaults
    check_ts = true,
    ts_config = {
      lua = {'string'},-- it will not add a pair on that treesitter node
      javascript = {'template_string'},
      java = false,-- don't check treesitter on java
    },
    disable_filetype = { "TelescopePrompt" },
    disable_in_macro = false,  -- disable when recording or executing a macro
    disable_in_visualblock = false, -- disable when insert after visual block mode
    ignored_next_char = ignored_next_char,
    enable_moveright = true,
    enable_afterquote = true,  -- add bracket pairs after quote
    enable_check_bracket_line = true,  --- check bracket in same line
    enable_bracket_in_quote = true, --
    map_cr = true,  -- map the <CR> key
    map_bs = true,  -- map the <BS> key
    map_c_h = false,  -- Map the <C-h> key to delete a pair
    map_c_w = false -- map <c-w> to delete a pair if possible
  })

  local cond = require('nvim-autopairs.conds')

  npairs.add_rule(
    Rule('<', '>', {'html', 'javascript', 'javascriptreact', 'vue', 'svelte', 'typescript', 'typescriptreact'})
      :with_pair(cond.not_after_regex(ignored_next_char))
      :with_move(function(opts)
        return opts.char == '>'
      end)
      :with_pair(cond.is_bracket_line())
  )

  -- (|) press space => ( | )
  -- ( | ) press ) => ( )|
  npairs.add_rules {
    Rule(' ', ' ')
      :with_pair(function (opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '{}', '[]' }, pair)
      end)
      -- only delete space if related to autopairs?
      :with_del(function(opts)
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local context = opts.line:sub(col - 1, col + 2)
        return vim.tbl_contains({ '(  )', '{  }', '[  ]' }, context)
      end),
    Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
    Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key(')'),
    Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(')'),
  }
end

autopairs.binds = {
  "<leader>",
  name = "+prefix",
  {
    {
      "t",
      name = "+tweak",
      {
        {
          "p",
          function()
            local autopairs_plugin = require("nvim-autopairs")
            if autopairs_plugin.state.disabled then
              autopairs_plugin.enable()
            else
              autopairs_plugin.disable()
            end
          end,
          name = "Toggle autopairs",
        },
      },
    },
  },
}
return autopairs
