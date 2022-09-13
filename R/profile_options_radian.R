#  ------------------------------------------------------------------------
#
# Title : radian terminal for R options
#    By : Jimmy Briggs
#  Date : 2022-03-18
#
#  ------------------------------------------------------------------------

options(
  radian.prompt = "\033[0;34m>\033[0m ",
  radian.color_scheme = "native",
  radian.editing_mode = "vi",
  radian.indent_lines = TRUE,
  radian.auto_match = TRUE,
  radian.auto_suggest = FALSE,
  radian.highlight_matching_bracket = TRUE,
  radian.auto_indentation = TRUE,
  radian.tab_size = 4,
  radian.complete_while_typing = TRUE,
  radian.completion_prefix_length = 3,
  radian.completion_timeout = 0.05,
  radian.completion_adding_spaces_around_equals = TRUE,
  radian.auto_width = TRUE,
  radian.insert_new_line = TRUE,
  radian.global_history_file = r_config_dir(".radian_history"), # "~/config/R/.radian_history"
  radian.history_search_no_duplicates = TRUE,
  radian.history_search_ignore_case = TRUE,
  radian.enable_reticulate_prompt = TRUE
)
