
#  ------------------------------------------------------------------------
#
# Title : Google Drive Setup
#    By : Jimmy Briggs
#  Date : 2021-11-19
#
#  ------------------------------------------------------------------------

library(gargle)
library(fs)
library(googledrive)

# options(
#   gargle_oauth_email = user_email,
#   gargle_oauth_cache =
# )

# Created a Service Account with Access to the Google Drive API and
# stored its downloaded clientID and secret JSON file under
# ~/.config/R/secrets/gargle/pwc/*

secrets <- fs::dir_ls(r_config_dir("secrets/gargle/pwc/"))

client_path <- secrets[[1]]
app_path <- secrets[[2]]
app_api_key <- Sys.getenv("GDRIVE_APP_API_KEY")
user_email <- "jimmy.briggs@pwc.com"

drive_auth_configure(path = client_path, api_key = app_api_key)

drive_auth(email = user_email,
           path = client_path,
           use_oob = TRUE)

drive_about()
drive_user()
drive_api_key()
drive_oauth_app()
drive_ls(path = "~")
