
#  ------------------------------------------------------------------------
#
# Title : Secrets
#    By : Jimmy Briggs
#  Date : 2022-03-18
#
#  ------------------------------------------------------------------------

# Load and Sync Custom `secrets.Renviron` with GitHub Gist:
local({
  if (!file.exists(r_config_dir("secrets/secrets.Renviron"))) {

    secrets <- config::get("secrets", file = r_config_dir("config.yml"))

    if (!require(gistr)) {
      if (file.exists(secrets$local_path)) {
        file.rename(secrets$local_path, paste0(secrets$local_path, ".bak"))
      }
      suppressMessages(
        utils::download.file(secrets$url, secrets$local_path, quiet = TRUE)
      )
    }
  }
})

# Read secrets.Renviron
readRenviron(r_config_dir("secrets/secrets.Renviron"))
