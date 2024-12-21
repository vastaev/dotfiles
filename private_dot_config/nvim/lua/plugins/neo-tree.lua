return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
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
