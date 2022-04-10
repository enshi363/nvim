require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"node_modules","dist","vendor",".git"},
    vimgrep_arguments = {
      "rg",
      "--hidden",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
    },
    -- ...
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      find_command = { "fd", 
        "--type", "file",
        "--exclude","node_modules/**",
        "--exclude",".git/**",
        "--exclude","vendor/**",
        "--hidden",
        "--color","never",
        "--size","-500k",
      },
    },
    live_grep = {
      previewer = false,
    }
  },
  extensions = {
    -- ...
    fzf = {
      fuzzy = false,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
                                        --the default case_mode is "smart_case"
    }
  },

}
require('telescope').load_extension('fzf')
