
#  ------------------------------------------------------------------------
#
# Title : R Options
#    By : Jimmy Briggs
#  Date : 2022-03-18
#
#  ------------------------------------------------------------------------

# Options
options(
  # Package Management
  repos = c(CRAN = "https://cran.rstudio.com"),
  # parallel package installations
  # run Sys.getenv("NUMBER_OF_PROCESSORS") or parallel::detectCores()
  Ncpus = 4L,
  # As of R 4.2 default "wininet" download method is deprecated on Windows
  # see <https://developer.r-project.org/blosxom.cgi/R-devel/2021/05/26>
  download.file.method = "libcurl",
  # editor and scripting
  editor = "notepad",
  pager = "internal",
  # remove scientific notation
  scipen = 999,
  useFancyQuotes = FALSE,
  tab.width = 2,
  max.print = 200,
  # browser and shiny
  browserNLdisabled = TRUE,
  shiny.launch.browser = TRUE,
  # orcid
  orcid = "0000-0002-7489-8787"
)

# Set Options:
source(r_config_dir("scripts/options/addinit_options.R"))
source(r_config_dir("scripts/options/blogdown_options.R"))
source(r_config_dir("scripts/options/gargle_options.R"))
source(r_config_dir("scripts/options/radian_options.R"))
source(r_config_dir("scripts/options/shrtcts_options.R"))
source(r_config_dir("scripts/options/usethis_options.R"))
source(r_config_dir("scripts/options/vscode_options.R"))

# list.files(
#   r_config_dir("scripts/options"),
#   "*_options.R",
#   full.names = TRUE
# ) |>
#   lapply(function(x) { invisible({ source(normalizePath(x)) }) })
