#  ------------------------------------------------------------------------
#
# Title : gargle (google apis) options script
#    By : Jimmy Briggs
#  Date : 2022-03-18
#
#  ------------------------------------------------------------------------

# install if necessary
# if (!("gargle" %in% rownames(utils::installed.packages()))) {
#   install.packages("gargle")
# }

options(
  gargle_oauth_email = "jimmy.briggs@jimbrig.com",
  gargle_oauth_cache = r_config_dir("config/gargle/gargle-oauth")
)
