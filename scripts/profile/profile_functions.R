# open_repo <- jimstools::open_gh_repo

# r_config_dir <- function(...) {
#   normalizePath(
#     file.path(
#       Sys.getenv("R_CONFIG_DIR", unset = normalizePath("~/.config/R")),
#       ...
#     )
#   )
# }

editrconfig <- function() {
  setwd(r_config_dir())
  rstudioapi::openProject(".", TRUE)
}

editrprof <- function() {
  file.edit(r_config_dir(".Rprofile"))
}

editrenv <- function() {
  file.edit(r_config_dir(".Renviron"))
}

editextras <- function() {
  file.edit(r_config_dir("scripts/profile/profile_functions.R"))
}

editsecrets <- function() {
  file.edit(r_config_dir("secrets/secrets.Renviron"))
}

editshortcuts <- function() {
  file.edit(getOption("shrtcts.path"))
}

#' @title Clear
#' @name clear
#' @description clear the active terminal
#' @noRD
clear <- function() {
  cmds <- list("unix" = "clear", "windows" = "cls")
  system(cmds[[.Platform$OS.type]])
}

#' @title Quietly Load Package
#' @name library2
#' @description suppress messages when loading a package
#' @param pkg the name of the package
#' @noRd
library2 <- function(pkg) {
  suppressPackageStartupMessages(library(pkg, character.only = TRUE))
}


#' @title Remove2
#' @name rm2
#' @description Force remove all objects from the current environment
#' @param except optional an array of object names to ignore
#' @noRd
rm2 <- function(except = NULL) {
  ignore <- c("clear", "library2", "rm2")
  if (!is.null(except)) ignore <- c(ignore, except)
  rm(list = setdiff(ls(envir = .GlobalEnv), ignore), envir = .GlobalEnv)
}

reload_rstudio <- function() {
  if (rstudioapi::isAvailable(version_needed = "1.2.1261")) {
    invisible(rstudioapi::executeCommand("reloadUi", quiet = TRUE))
  }
}

reload_r <- function() {
  if (rstudioapi::isAvailable(version_needed = "1.2.1261")) {
    invisible(rstudioapi::executeCommand("restartR",
                                         quiet = TRUE))
  }
}

detach_all_attached <- function() {
  all_attached <-
    paste("package:", names(utils::sessionInfo()$otherPkgs),
          sep = "")

  try({
    suppressWarnings(invisible(
      lapply(
        all_attached,
        detach,
        character.only = TRUE,
        unload = TRUE
      )
    ))
  }, silent = TRUE)

}

explorer <- function(path = getwd()) {
  y <- gsub("/", "\\\\", path)
  suppressWarnings({
    invisible(shell(paste0("explorer ", y), intern = TRUE))
  })
}

view_path <- function() {
  writeLines(strsplit(Sys.getenv("PATH"), ";")[[1]])
}

search_gh <- function(s,
                      type = "all",
                      language = NULL,
                      topic = NULL,
                      user = NULL,
                      org = NULL) {
  types <- c(
    "all",
    "repo",
    "code",
    "commit",
    "issue",
    "discussion",
    "package",
    "marketplace",
    "topic",
    "wiki",
    "user"
  )

  match.arg(type, types)
  type_query <-
    ifelse(type == "all", "&ref=opensearch", paste0("&type=", type))
  base_url <- "https://github.com/search?q="
  lang_query <-
    ifelse(is.null(language), "", paste0("+language%3A", language))
  topic_query <-
    ifelse(is.null(topic), "", paste0("+topic%3A", topic))
  user_query <- ifelse(is.null(user), "", paste0("+user%3A", user))
  org_query <- ifelse(is.null(org), "", paste0("org%3A", org))
  query <-
    paste0(s,
           " ",
           lang_query,
           topic_query,
           user_query,
           org_query,
           type_query)

  url <- paste0(base_url, query)

  utils::browseURL(url)

  invisible(return(url))

}

search_ghr <- function(s, ...) {
  search_gh(s, language = "R")
}

search_cran <- function(s, ...) {
  browseURL(paste0("https://github.com/cran/", s))
}

sandbox <- function(rstudio = TRUE) {
  path <- fs::path_home("Dev/sandbox")
  if (rstudio) rstudioapi::filesPaneNavigate("~/Dev/sandbox") else explorer(path)
}

# Google Calendar ---------------------------------------------------------
set_gcal_config <- function(to = c("personal", "pwc")) {

  pre <- list(
    "GOOGLE_CLIENT_ID" = Sys.getenv("GOOGLE_CLIENT_ID"),
    "GOOGLE_CLIENT_SECRET" = Sys.getenv("GOOGLE_CLIENT_SECRET")
  )

  to = match.arg(to)

  if (to == "personal") {
    Sys.setenv(GOOGLE_CLIENT_ID = Sys.getenv("GCAL_CLIENT_ID_PERSONAL"))
    Sys.setenv(GOOGLE_CLIENT_SECRET = Sys.getenv("GCAL_CLIENT_SECRET_PERSONAL"))
    message("Google Calendar using PERSONAL environment variables")
  }
  if (to == "pwc") {
    Sys.setenv(GOOGLE_CLIENT_ID = Sys.getenv("GCAL_CLIENT_ID_PWC"))
    Sys.setenv(GOOGLE_CLIENT_SECRET = Sys.getenv("GCAL_CLIENT_SECRET_PWC"))
    message("Google Calendar using PWC environment variables")
  }

  return(invisible(pre))

}



