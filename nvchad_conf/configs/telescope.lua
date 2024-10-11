local telescope = require('telescope.builtin')
local telescope_state = require('telescope.state')

local last_search = nil

local function search_with_cache()
  if last_search == nil then
    telescope.live_grep()

    local cached_pickers = telescope_state.get_global_key "cached_pickers" or {}
    last_search = cached_pickers[1]
  else
    telescope.resume({ picker = last_search })
  end
end

vim.keymap.set('n', '<leader>fc', search_with_cache)
