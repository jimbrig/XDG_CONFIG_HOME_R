

#  ------------------------------------------------------------------------
#
# Title : VSCode and Language Serve R Options
#    By : Jimmy Briggs
#  Date : 2022-03-18
#
#  ------------------------------------------------------------------------

# require(pak)

# dependencies
# c(
#   "languageserver",
#   "styler",
#   "rmarkdown",
#   "httpgd",
#   "ManuelHentschel/vscDebugger"
# ) |>
#   lapply(pak::pak)

# vscode
options(
  vsc.use_httpgd = TRUE,
  vsc.helpPanel = "Beside",
  vsc.viewer = "Beside",
  vsc.browser = "Beside",
  vsc.show_object_size = FALSE,
  vsc.use.httpgh = TRUE
)

# vscode language server
options(
  languageserver.formatting_style = function(options) {
    styler::tidyverse_style(start_comments_with_one_space = TRUE,
                            indent_by = 4)
  },
  languageserver.snippet_support = FALSE,
  languageserver.server_capabilities = list(documentHighlightProvider = FALSE)
)
