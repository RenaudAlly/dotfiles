return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",  -- for prettier file-specific icons
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup {}    -- default config
  end,
}
