-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Looking at Directory Contents or not
vim.keymap.set('n', '<leader>fo', ':Neotree source=filesystem action=show<CR>', { noremap = true, silent = true, desc = 'Opens neo-tree filesystem' })
vim.keymap.set('n', '<leader>fg', ':Neotree source=git_status<CR>', { noremap = true, silent = true, desc = 'Opens neo-tree git' })
vim.keymap.set('n', '<leader>fc', ':Neotree action=close<CR>', { noremap = true, silent = true, desc = 'Closes neo-tree filesystem' })

-- Indenting 
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Commenting
vim.api.nvim_set_keymap('n', '<C-/>', 'gcc', { noremap = false }) -- keybind for ctrl + / (gotten by going into Insert mode and then <c-v> + <c-/>
vim.api.nvim_set_keymap('v', '<C-/>', 'gcc', { noremap = false })

-- Toggling transparency (for colorscheme)
vim.keymap.set("n", "<leader>tt", ":TransparentToggle<CR>", { noremap = true, silent = true, desc = "Toggles transparency" })

-- Changing, deleting words in various modes
-- I prefer that cw always deletes the entire word rather than till the end of the word
vim.keymap.set({"n", "v"}, 'cw', 'ciw', {noremap = true, silent = true, desc = 'Change word entirely'})
vim.keymap.set({"n", "v"}, 'dw', 'diw', {noremap = true, silent = true, desc = 'Delete word entirely'})
-- I'm more used to the following binding from muscle memory
vim.keymap.set("i", "<C-H>", "<C-W>", {noremap = true, silent = true})
-- vim: ts=2 sts=2 sw=2 et

-- Making navigation easier on the eyes
vim.keymap.set("n", "<C-d>", "<C-d>zz", {noremap = true})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {noremap = true})
