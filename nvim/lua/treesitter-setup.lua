-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Autoupdating treesitter 
    build = ':TSUpdate',
    -- Lazy loading plugin only when a buffer is opened
    event = { 'BufReadPre', 'BufNewFile' },

    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash', 'regex', 'markdown', 'markdown_inline' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    -- Autotags support for HTML tags in nvim-ts-autotag
    autotag = { enable = true, },
    highlight = { enable = true },
    indent = { enable = true },
    -- helps select using syntax tree
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',      -- enter
        node_incremental = '<CR>',    -- enter
        scope_incremental = false, --
        node_decremental = '<BS>',    -- backspace
      },
    },
    textobjects = { -- equivalent to nvim-treesitter-textobjects.nvim
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          -- works in visual mode, change, delete for example
          ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
          ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
          ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
          ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

          ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of argument'},
          ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of argument'},

          ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional'},
          ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional'},

          ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop'},
          ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop'},

          ['af'] = { query = '@call.outer', desc = 'Select outer part of a function call'},
          ['if'] = { query = '@call.inner', desc = 'Select inner part of a function call'},

          ['am'] = { query = '@function.outer', desc = 'Select outer part of a method definition'},
          ['im'] = { query = '@function.inner', desc = 'Select inner part of a method definition'},

          ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class'},
          ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class'},
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist (ctrl + o, ctrl + i)
        goto_next_start = {
            ["]f"] = { query = "@call.outer", desc = "Next function call start" },
            ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
            ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]F"] = { query = "@call.outer", desc = "Next function call end" },
            ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
            ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
            ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
            ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
            ["[c"] = { query = "@class.outer", desc = "Prev class start" },
            ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
            ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
            ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
            ["[C"] = { query = "@class.outer", desc = "Prev class end" },
            ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
            ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
          },
      },
      swap = {
        enable = true,
        swap_next = {
          -- i have added 4 keys because this would be rather rarely used keymap 
          -- hence its more important to me that it's memorable with [s]wap
          ['<leader>sna'] = '@parameter.inner', -- swap argument/parameter with next
          ['<leader>snm'] = '@function.outer', -- swap function with next
        },
        swap_previous = {
          ['<leader>spa'] = '@parameter.inner', -- swap argument/parameter with previous
          ['<leader>spm'] = '@function.outer', -- swap function with previous
        },
      },
    },
  }

  local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

  -- vim way: ; goes to the direction you were moving.
  vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
  vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

  -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
  vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
  vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
  vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
  vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

end, 0)

-- vim: ts=2 sts=2 sw=2 et
