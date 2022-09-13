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
  Ncpus = as.integer(Sys.getenv("NUMBER_OF_PROCESSORS")) - 2L,
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
source(r_config_dir("R/profile_options_addinit.R"))
source(r_config_dir("R/profile_options_blogdown.R"))
source(r_config_dir("R/profile_options_gargle.R"))
source(r_config_dir("R/profile_options_radian.R"))
source(r_config_dir("R/profile_options_shrtcts.R"))
source(r_config_dir("R/profile_options_usethis.R"))
source(r_config_dir("R/profile_options_vscode.R"))
