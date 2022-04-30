
#  ------------------------------------------------------------------------
#
# Title : R Shortcuts via `shrtcts`
#    By : Jimmy Briggs
#  Date : 2022-03-18
#
#  ------------------------------------------------------------------------

# shortcuts
if (interactive() && requireNamespace("shrtcts", quietly = TRUE)) {
  shrtcts::add_rstudio_shortcuts(
    path = getOption("shrtcts.path"),
    set_keyboard_shortcuts = TRUE
  )
}
