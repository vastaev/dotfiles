return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        ".DS_Store",
      },
      filtered_items = {
        hide_dotfiles = false,
      },
    },
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          -- auto close
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}
