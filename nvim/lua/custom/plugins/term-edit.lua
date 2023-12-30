return {
    'chomosuke/term-edit.nvim',
    lazy = false, -- or ft = 'toggleterm' if you use toggleterm.nvim
    version = '1.*',
    -- Settng options is compulsory
    opts = {
          -- Setting this true will enable printing debug information with print()
        debug = false,

        -- Number of event loops it takes for <Left>, <Right> or <BS> keys to change
        -- the cursor's position.
        -- If term-edit.nvim is unreliable, increasing this value could help.
        -- Decreasing this value can increase the responsiveness of term-edit.nvim
        feedkeys_delay = 10,

        -- Use case 1: I want to press 'o' instead of 'i' to enter insert.
        --   `mapping = { n --[[normal mode]] = { i = 'o' } }`
        --   `vim.keymap.set('n', 'o', 'i', { remap = true })` will achieve the same
        --   thing. (won't work without remap = true)
        -- Use case 2: I want to map 'c' to 'd' and 'd' to 'c'
        --   (keymap with remap is no longer an option)
        --   `mapping = { n = { c = 'd', d = 'c' } }` (will also map 'cc' to 'dd'
        --   and 'dd' to 'cc')
        -- Use case 3: I already mapped s to something else and do not want
        --   term-edit.nvim to override my mapping.
        --   `mapping = { n = { s = false } }`
        --
        -- For more examples and detailed explaination, see :h term-edit.mapping
        mapping = {
            -- mode = {
            --     lhs = new_lhs
            -- }
        },

        -- If this function returns true, term-edit.nvim will use up and down arrow
        -- to move the cursor as well as left and right arrow.
        -- It will be called before terminal mode is entered and the cursor is moved.
        use_up_down_arrows = function()
            return false
            -- -- In certain environment, left and right arrows can not move the
            -- -- cursor to the previous or next line, but up and down arrows can,
            -- -- one example is ipython.
            -- -- Below is an example that works for ipython
            --
            -- -- get content for line under cursor
            -- local line = vim.fn.getline(vim.fn.line '.')
            -- if line:find(']:', 1, true) or line:find('...:', 1, true) then
            --   return true
            -- else
            --   return false
            -- end
        end,

        -- Used to detect the start of the command
        prompt_end = '%$ ',
    }
}
