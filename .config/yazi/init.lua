-- ~/.config/yazi/init.lua

require("bunny"):setup({
  hops = {
    { key = "i",          path = "/usr/share/icons/Papirus-Dark", desc = "Icons" },
    { key = "y",          path = "/home/libor/.config/yazi/", desc = "Yazi" },
    { key = "r",          path = "~/.config/rofi/", desc = "Rofi" },
    { key = { "l", "s" }, path = "~/.local/share", desc = "Local share"  },
    { key = { "l", "b" }, path = "~/.local/bin",   desc = "Local bin"    },
    -- key and path attributes are required, desc is optional
  },
  desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
  ephemeral = true, -- Enable ephemeral hops, default is true
  tabs = true, -- Enable tab hops, default is true
  notify = false, -- Notify after hopping, default is false
  fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})
