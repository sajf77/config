return {
  "folke/tokyonight.nvim",
  lazy = false,    -- Make sure colorscheme loads on startup
  priority = 1000, -- Load before all other plugins
  opts = {
    -- Choose style: "storm", "moon", "night" (darkest), or "day" (light)
    style = "night",
    transparent = true, -- Set to true for terminal transparency
    terminal_colors = true, -- Set terminal colors for :terminal
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "dark", -- Darker background on sidebars (NvimTree, trouble, etc.)
      floats = "dark",   -- Darker background on floating windows
    },
    sidebars = { "qf", "help", "terminal", "packer" },
    dim_inactive = false, -- Dims inactive split windows
    lualine_bold = true,  -- Bold section headers in lualine
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    -- Load the colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end,
}
