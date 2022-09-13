#  ------------------------------------------------------------------------
#
# Title : R Settings
#    By : Jimmy Briggs
#  Date : 2022-03-18
#
#  ------------------------------------------------------------------------

# turn on completion of installed package names
utils::rc.settings(ipck = TRUE)

# Setup .Rhistory
if (!(file.exists(r_config_dir(".Rhistory")))) file.create(r_config_dir(".Rhistory"))
Sys.setenv("R_HISTFILE" = r_config_dir(".Rhistory"))
.Last <- function() if (interactive()) try(savehistory(r_config_dir(".Rhistory")))

# Error Tracing
if ('rlang' %in% loadedNamespaces()) options(error = rlang::entrace)

# Package Installation Error Callback from 'pak':
if (interactive() && getRversion() >= "4.0.0" && has_pak()) {
  globalCallingHandlers(
    packageNotFoundError = function(err) {
      try(pak::handle_package_not_found(err))
    }
  )
}

# Custom Start up Prompt
setHook("rstudio.sessionInit", function(newSession) {
  if (newSession)
    cli::cli_alert_info(paste0("RStudio Version: ", rstudioapi::getVersion()))
}, action = "append")

# Check for any updates for R:
if (interactive() && curl::has_internet()) check_rver() # invisible(installr::check.for.updates.R(GUI = FALSE))

# r-cli
if (nzchar(Sys.getenv("R_CMD")) && require("rcli", quietly = TRUE)) rcli::r_cmd_call()
