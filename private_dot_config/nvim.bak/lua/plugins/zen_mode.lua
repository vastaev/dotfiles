return {
    "folke/zen-mode.nvim",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        plugins = {
            gitsigns = { enabled = false }, -- disables git signs
            tmux = { enabled = true }, -- disables the tmux statusline
            wezterm = {
                enabled = true,
                font = "+20", -- (10% increase per step)
            },
        }
    }
}
