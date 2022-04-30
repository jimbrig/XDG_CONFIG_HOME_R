
#  ------------------------------------------------------------------------
#
# Title : Deprecated RProfile Setup
#    By : Jimmy Briggs
#  Date : 2022-03-18
#
#  ------------------------------------------------------------------------

# DEPRECATED --------------------------------------------------------------

# avoid i386 arch installations/compilations:
# options(
#   remotes.install.args = "--no-multiarch",
#   devtools.install.args = "--no-multiarch",
# )

# autoload magrittr PIPE
# autoload("%>%", "magrittr")

# if (requireNamespace("jetpack", quietly = TRUE)) {
#   jetpack::load()
# } else {
#   message("Install Jetpack to use a virtual environment for this project")
# }

# Set GH PAT
# local({
#   require("credentials")
#   credentials::set_github_pat()
# })

# set locale
# invisible(Sys.setlocale("LC_ALL", "English_United States.1252"))

# parallel::detectCores()
# benchmarkme::get_ram()
# benchmarkme::get_cpu()

# default to launching shiny apps in external browser
# if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::hasFun("viewer")) {
#   options(shiny.launch.browser = .rs.invokeShinyWindowExternal)
# }

# shrtcts::list_shortcuts()
# if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager") BiocManager::install(version = "3.12")

# else {
# gistr::gist_save(secrets$local_path, secrets$ _gist_path)
# }

# prompt::set_prompt(function(...){
#   paste0(
#     "[", prompt::git_branch(), prompt::git_dirty(), prompt::git_arrows(), "] ",
#     prompt::prompt_memuse()
#   )
# })

# options(
#   kickstarteR.setup = list(
#     packages = c('dplyr', 'purrr', 'lubridate', 'stringr', 'rstudioapi', 'pak', 'pacman', 'devtools'),
#     sets = list(
#       shiny = c('shiny', 'shinydashboard', 'shinyWidgets', 'DT', 'highcharter', 'shinyjs'),
#       tidy = c('dplyr', 'reshape2'),
#       excel = c('readxl', 'writexl')
#     )
#   )
# )
