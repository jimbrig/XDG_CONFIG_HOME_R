#  ------------------------------------------------------------------------
#
# Title : .Rprofile - Jimmy Briggs
#    By : Jimmy Briggs
#  Date : 2021-04-13
#
#  ------------------------------------------------------------------------


# source utils ------------------------------------------------------------

source("~/.config/R/R/utils.R")

# Ensure Library is Set:
Sys.setenv("R_LIBS_USER" = r_lib_dir())
.libPaths(path.expand(Sys.getenv("R_LIBS_USER", unset = r_lib_dir())))

# Source profile_options:
source(r_config_dir("R/profile_options.R"))

# Source profile_settings:
source(r_config_dir("R/profile_settings.R"))

# Source profile_secrets:
source(r_config_dir("R/profile_secrets.R"))

# Source profile_shortcuts:
source(r_config_dir("R/profile_shortcuts.R"))

# set paths before clearing env
funcpath <- r_config_dir("R/profile_functions.R")
utilpath <- r_config_dir("R/utils.R")

# Clear Environment
rm(list = setdiff(ls(), c("funcpath", "utilpath")))

# Setup `.rprofile` Environment for Extra Helper Functions:
.rprofile <- new.env()

# Source profile_functions:
sys.source(
  funcpath,
  .rprofile
)

# add back utils
sys.source(
  utilpath,
  .rprofile
)

# Attach to `.rprofile` Environment
attach(.rprofile)

# Detach
detach_all_attached()

# remove r_config_dir from .globalenv
rm(list = ls())

# #  ------------------------------------------------------------------------
# #
# # Title : .Rprofile - Jimmy Briggs
# #    By : Jimmy Briggs
# #  Date : 2021-04-13
# #
# #  ------------------------------------------------------------------------
#
# # `r_config_dir` Function:
# r_config_dir <- function(...) {
#   normalizePath(
#     file.path(
#       Sys.getenv("R_CONFIG_DIR", unset = normalizePath("~/.config/R")),
#       ...
#     )
#   )
# }
#
# # Ensure Library is Set:
# .libPaths(path.expand(Sys.getenv("R_LIBS", unset = r_config_dir("lib/4.2"))))
#
# # Source profile_options:
# source(r_config_dir("scripts/profile/profile_options.R"))
#
# # Source profile_settings:
# source(r_config_dir("scripts/profile/profile_settings.R"))
#
# # Source profile_secrets:
# source(r_config_dir("scripts/profile/profile_secrets.R"))
#
# # Source profile_shortcuts:
# source(r_config_dir("scripts/profile/profile_shortcuts.R"))
#
# # Setup `.rprofile` Environment for Extra Helper Functions:
# .rprofile <- new.env()
#
# # Source profile_functions:
# sys.source(
#   r_config_dir("scripts/profile/profile_functions.R"),
#   .rprofile
# )
#
# # Attach to `.rprofile` Environment
# attach(.rprofile)
#
# # Detach
# detach_all_attached()
#
# # Clear Environment
# # rm(list = setdiff(ls(), "r_config_dir"))
