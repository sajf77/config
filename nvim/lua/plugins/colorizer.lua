return {
  "brenoprata10/nvim-highlight-colors",
  event = "BufReadPre",
  opts = {
    -- Options: 'background', 'foreground', or 'virtual'
    render = "background", 

    -- Set virtual symbol if you use render = 'virtual'
    virtual_symbol = "■",

    -- Enable color types
    enable_hex = true,
    enable_short_hex = true,
    enable_rgb = true,
    enable_hsl = true,
    enable_var_usage = true, -- Highlight CSS variables like var(--my-color)
    enable_tailwind = true,   -- Highlight Tailwind CSS classes
  },
}
