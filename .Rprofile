
#  ------------------------------------------------------------------------
#
# Title : .Rprofile - Jimmy Briggs
#    By : Jimmy Briggs
#  Date : 2021-04-13
#
#  ------------------------------------------------------------------------

# `r_config_dir` Function:
r_config_dir <- function(...) {
  normalizePath(
    file.path(
      Sys.getenv("R_CONFIG_DIR", unset = normalizePath("~/.config/R")),
      ...
    )
  )
}

# Ensure Library is Set:
.libPaths(path.expand(Sys.getenv("R_LIBS", unset = r_config_dir("lib/4.2"))))

# Source profile_options:
source(r_config_dir("scripts/profile/profile_options.R"))

# Source profile_settings:
source(r_config_dir("scripts/profile/profile_settings.R"))

# Source profile_secrets:
source(r_config_dir("scripts/profile/profile_secrets.R"))

# Source profile_shortcuts:
source(r_config_dir("scripts/profile/profile_shortcuts.R"))

# Setup `.rprofile` Environment for Extra Helper Functions:
.rprofile <- new.env()

# Source profile_functions:
sys.source(
  r_config_dir("scripts/profile/profile_functions.R"),
  .rprofile
)

# Attach to `.rprofile` Environment
attach(.rprofile)

# Detach
detach_all_attached()

# Clear Environment
# rm(list = setdiff(ls(), "r_config_dir"))
