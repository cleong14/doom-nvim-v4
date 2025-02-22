-- https://github.com/numToStr/Comment.nvim
local comment = {}

comment.settings = {
  --- Add a space b/w comment and the line
  --- @type boolean
  padding = true,

  --- Whether the cursor should stay at its position
  --- NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
  --- @type boolean
  sticky = true,

  --- Lines to be ignored while comment/uncomment.
  --- Could be a regex string or a function that returns a regex string.
  --- Example: Use '^$' to ignore empty lines
  --- @type string|fun():string
  ignore = nil,

  ---LHS of toggle mappings in NORMAL mode
  toggler = {
    ---Line-comment toggle keymap
    line = 'gcc',
    ---Block-comment toggle keymap
    block = 'gbc',
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = 'gc',
    ---Block-comment keymap
    block = 'gb',
  },
  ---LHS of extra mappings
  extra = {
    ---Add comment on the line above
    above = 'gcO',
    ---Add comment on the line below
    below = 'gco',
    ---Add comment at the end of line
    -- eol = 'gcA',
    eol = 'gcL',
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  -- mappings = {
  --   ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
  --   basic = true,
  --   ---Extra mapping; `gco`, `gcO`, `gcA`
  --   extra = true,
  --   ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
  --   extended = false,
  -- },
  ---Function to call before (un)comment
  -- pre_hook = nil,
  ---Function to call after (un)comment
  post_hook = nil,

  --- Passes to ts-context-commentstring to get commentstring in JSX
  pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == "typescriptreact" then
      local comment_utils = require("Comment.utils")

      -- Detemine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == comment_utils.ctype.line and "__default" or "__multiline"

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == comment_utils.ctype.block then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end

      return require("ts_context_commentstring.internal").calculate_commentstring({
        key = type,
        location = location,
      })
    end
  end,
}

comment.packages = {
  ["Comment.nvim"] = {
    "numToStr/Comment.nvim",
    commit = "7c49fb2ac01a9f03410100c8e78f647bbea857e8",
    module = "Comment",
  },
}

comment.configs = {}
comment.configs["Comment.nvim"] = function()
  local config = vim.tbl_extend("force", doom.features.comment.settings, {
    -- Disable mappings as we'll handle it in binds.lua
    -- mappings = {
    --   basic = false,
    --   extra = false,
    --   extended = false,
    -- },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
      ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      ---Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
      ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
      extended = false,
    },
  })

  require("Comment").setup(config)
end

comment.binds = {}
-- comment.binds = {
--   {
--     "gc",
--     [[<cmd>lua require("Comment.api").call("toggle_linewise_op")<CR>g@]],
--     name = "Comment motion",
--   },
--   {
--     "gc",
--     [[<Esc><cmd>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>]],
--     name = "Comment line",
--     mode = "v",
--   },
--   {
--     "gb",
--     [[<Esc><cmd>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>]],
--     name = "Comment block",
--     mode = "v",
--   },
--   {
--     "gcc",
--     [[<cmd>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$]],
--     name = "Comment line",
--   },
--   {
--     "gcA",
--     [[<cmd>lua require("Comment.api").insert_linewise_eol()<CR>]],
--     name = "Comment end of line",
--   },
-- }
return comment
