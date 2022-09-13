#  ------------------------------------------------------------------------
#
# Title : R Configuration Utility Functions
#    By : Jimmy Briggs <jimmy.briggs@jimbrig.com>
#  Date : 2022-07-30
#
#  ------------------------------------------------------------------------


# check_rver --------------------------------------------------------------

check_rver <- function(notify_user = TRUE,
                       GUI = FALSE,
                       page_with_download_url = "https://cran.rstudio.com/bin/windows/base/",
                       pat = "R-[0-9.]+.+-win\\.exe") {

  page <- readLines(page_with_download_url, warn = FALSE)

  filename <- stats::na.omit(stringr::str_extract(page, pat))[1]

  latest_R_version <- stringr::str_extract(filename, "[0-9.]+")

  pat <- "Last change: [0-9.]+-[0-9.]+-[0-9.]+"

  target_line <- grep(pat, page, value = TRUE)

  m <- regexpr(pat, target_line)

  latest_R_date <- regmatches(target_line, m)

  latest_R_date <- gsub(pattern = "Last change: ", "", latest_R_date)

  current_R_version <- as.character(getRversion())

  there_is_a_newer_version <- utils::compareVersion(current_R_version, latest_R_version) == -1

  if (there_is_a_newer_version) {
    message_text <- paste(
      "There is a newer version of R for you to download!\n\n",
      "You are using R version:    \t",
      gsub("R version", "", R.version$version.string),
      "\n",
      "And the latest R version is:\t ",
      latest_R_version,
      " (",
      latest_R_date,
      ")",
      "\n",
      sep = "")
  }
  else {
    message_text <- paste(
      "No need to update. You are using the latest R version: ",
      R.version$version.string)
  }
  if (notify_user) {
    if (GUI) {
      winDialog(type = "ok", message = message_text)
    }
    else {
      if (there_is_a_newer_version) {
        cli::cli_alert_warning(message_text)
      } else {
        cli::cli_alert_success(message_text)
      }
    }
  }
  invisible(there_is_a_newer_version)
}

# `r_config_dir` Function: ------------------------------------------------

#' r_config_dir
#'
#' @description
#' R Configuration Directory Utility Function. Helper function for retrieving
#' and settings the user's custom `R_CONFIG_DIR`.
#'
#' @details
#' This function appends path elements to your default `R_CONFIG_DIR`. To find
#' `R_CONFIG_DIR` it will first attempt to search for the `R_CONFIG_DIR` environment
#' variable, and if unset defaults to `~/.config/R` on all operating systems
#' (i.e. `%USERPROFILE%\.config\R` on Windows).
#'
#' @param ... Path elements passed as character strings to append to `R_CONFIG_DIR`
#'
#' @return Character string of the path
#'
#' @seealso
#'   - <https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html>
#'
#' @export
#'
#' @examples
#' # retrieve path to .Rprofile (i.e. ~/.config/R/.Rprofile)
#' r_config_dir(".Rprofile")
#'
#' # retrieve path to your "profile" configuration directory
#' # (i.e. ~/.config/R/profile)
#' r_config_dir("profile")
r_config_dir <- function(...) {
  normalizePath(
    file.path(
      Sys.getenv("R_CONFIG_DIR", unset = normalizePath("~/.config/R", winslash = .Platform$file.sep)),
      ...
    ),
    winslash = .Platform$file.sep
  )
}


# `r_localapp_dir` Function: ----------------------------------------------


#' r_localapp_dir
#'
#' @description
#' R User's `%LOCALAPPDIR%` Directory Utility Function.
#'
#' @details
#' Helper function for retrieving the default R installation's local app
#' directory, i.e. `%LOCALAPPDIR%\R` on Windows.
#'
#' @note
#' Starting with R Version `4.2.0` the default `.libPath` for installed R
#' packages changed on windows to the `%LOCALAPPDIR%\R\win-library\x.y` path.
#'
#' @param ... Path elements passed as character strings to append to `%LOCALAPPDIR%\R`
#'
#' @return Character string of the path
#'
#' @seealso
#' The `WINDOWS` specific section of
#' <https://cran.microsoft.com/snapshot/2022-07-26/doc/manuals/r-devel/NEWS.html>.
#'
#' @export
#'
#' @examples
#' # retrieve path to the default R localappdir
#' r_localapp_dir()
r_localapp_dir <- function(...) {
  normalizePath(
    file.path(
      Sys.getenv("LOCALAPPDATA"),
      "R",
      ...
    ),
    winslash = .Platform$file.sep
  )
}


# `r_lib_dir` Function: ---------------------------------------------------


#' r_lib_dir
#'
#' @description
#' Quick alternative to running `.libPaths()[1]`. Retrieves the user's `R_LIBS_USER`
#' path.
#'
#' @return Character string of the path
#' @export
#'
#' @examples
#' r_lib_dir()
r_lib_dir <- function() {
  normalizePath(
    file.path(
      r_localapp_dir(
        "win-library",
        paste0(R.Version()$major, ".", substr(R.Version()$minor, start = 1, stop = 1))
      )
    ),
    winslash = .Platform$file.sep
  )
}

#' Install `pak`
#'
#' @description
#' Installs the `pak` R package by `r-lib` from their official binary GitHub build.
#'
#' @return Invisible `NULL`
#' @export
#'
#' @details
#' Note this installs the development version of `r-lib/pak` using the following
#' code:
#'
#' ```R
#' repo <- sprintf(
#'   "https://r-lib.github.io/p/pak/stable/%s/%s/%s",
#'   .Platform$pkgType,
#'   R.Version()$os,
#'   R.Version()$arch
#' )
#'
#' install.packages("pak", repos = repo)
#' ```
#'
#' @seealso
#' - [utils::install.packages()]
#' - [pak::pak()]
#' - [r-lib/pak](https://github.com/r-lib/pak)
#'
#' @importFrom utils install.packages
#'
#' @examples
#' \dontrun{
#' inst_pak()
#' }
inst_pak <- function() {

  repo <- sprintf(
    "https://r-lib.github.io/p/pak/stable/%s/%s/%s",
    .Platform$pkgType,
    R.Version()$os,
    R.Version()$arch
  )

  utils::install.packages("pak", repos = repo)

}

get_installed_packages <- function() {
  pkgs <- as.data.frame(utils::installed.packages()[,c(1,3:4)])
  rownames(pkgs) <- NULL
  pkgs <- pkgs[is.na(pkgs$Priority), 1:2, drop = FALSE]
}

has_pak <- function() {

  pkgs <- get_installed_packages()

  "pak" %in% pkgs$Package

}
