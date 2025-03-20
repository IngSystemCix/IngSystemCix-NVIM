return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      model = { insert = true, command = false, terminal = false },
      mappings = {
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][%s%w]" },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][%s%w]" },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][%s%w]" },
        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\][%s%w]" },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\][%s%w]" },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\][%s%w]" },
        ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%w]" },
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w]" },
        ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^%w]" },
      }
    }
  }
}