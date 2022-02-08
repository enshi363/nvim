require('telescope').setup{
  defaults = {
    -- ...
    file_ignore_patterns = {"node_modules","dist","vendor",".git"},
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    live_grep = {
      theme = "dropdown",
      previewer = false,
    }
  },
  extensions = {
    -- ...
    fzf = {
      fuzzy = false,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                        --the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')