#  ------------------------------------------------------------------------
#
# Title : Installation script
#    By : Jimmy Briggs
#  Date : 2021-02-03
#
#  ------------------------------------------------------------------------

# remotes and devtools
install.packages(c("remotes", "devtools", "gh"))

# Install pak
install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/")
pak::pak(pacman)

# required
pacman::p_load(
  fs,
  golem,
  purrr,
  qs
)

# run as a background job

pkgs <- c(
  # shiny
  "shiny",
  "shinydashboard",
  "htmlwidgets",
  "listviewer",
  "miniUI",
  "shinygadgets",
  "shinyLP",
  "shinystan",
  "shinyWidgets",
  "tooltipsteR",
  "v8",
  "xmlview",
  "jsonlite",
  "shinyjs",
  "flexdashboard",
  "editR",
  # data
  "dplyr",
  "fuzzyjoin",
  "safejoin",
  "janitor",
  "tidyr",
  "multidplyr",
  "naturalsort",
  "reshape",
  "reshape2",
  "plyr",
  "spdplyr",
  "tibble",
  "widyr",
  # databases
  "bigrquery",
  "DBI",
  "lazysql",
  "pool",
  "RMySQL",
  "RPostgreSQL",
  "RSQLite",
  "firebase",
  "dbx",
  # dates
  "anytime",
  "AnomalyDetection",
  "chron",
  "forecast",
  "hms",
  "lubridate",
  "seasonal",
  "timeDate",
  "timekit",
  "TSDist",
  "tseries",
  "x13binary",
  "xts",
  "zoo",
  # design
  "colormap",
  "ColorPalette",
  "extrafont",
  "RColorBrewer",
  "rPlotter",
  "wesanderson",
  # dev
  "glue",
  "assertthat",
  "covr",
  "ctv",
  "devtools",
  "evaluate",
  "fuzzr",
  "lazyeval",
  "microbenchmark",
  "packrat",
  "parallel",
  "pkgdown",
  "profr",
  "profvis",
  "pryr",
  "R6",
  "rbenchmark",
  "rjsonapi",
  "rstudioapi",
  "testthat",
  "testwhat",
  "tools",
  "withr",
  # graphics
  "arulesViz",
  "choroplethr",
  "colorspace",
  "cowplot",
  "d3vennR",
  "dendextend",
  "diagram",
  "directlabels",
  "dygraphs",
  "EBImage",
  "eVenn",
  "ggalluvial",
  "GGally",
  "ggExtra",
  "ggfortify",
  "ggghost",
  "ggmap",
  "ggmcmc",
  "ggplot2",
  "ggRandomForests",
  "ggsubplot",
  "ggthemes",
  "ggtree",
  "ggvis",
  "googleVis",
  "gplots",
  "graphTweets",
  "grDevices",
  "gridExtra",
  "grImport",
  "gtable",
  "highcharter",
  "hexbin",
  "igraph",
  "jpeg",
  "LDAvis",
  "magick",
  "mapmate",
  "minimap",
  "pcaBootPlot",
  "plotrix",
  "plotly",
  "rCharts",
  "rMaps",
  "RSvgDevice",
  "rvg",
  "rworldmap",
  "sinaplot",
  "svglite",
  "tableplot",
  "timevis",
  "treemap",
  "tweenr",
  "UpSetR",
  "VennDiagram",
  "venneuler",
  "viridis",
  "ViSiElse",
  "visNetwork",
  # programming
  "purrr",
  "purrrlyr",
  "rlang",
  "Reproducible",
  "bibtex",
  "knitcitations",
  "knitr",
  "lazyWeave",
  "pander",
  "RefManageR",
  "remake",
  "repmis",
  # reporting
  "rmarkdown",
  "rmdHelpers",
  "knitr",
  "kableExtra",
  "pander",
  "blogdown",
  "hugo",
  "xtable",
  # geo
  "Spatial",
  "albersusa",
  "CartoDB",
  "cartography",
  "fields",
  "geographr",
  "GEOmap",
  "geosphere",
  "gmt",
  "lawn",
  "longitudinalData",
  "maps",
  "maptools",
  "osmdata",
  "osmplotr",
  "osrm",
  "postGIStools",
  "plotKML",
  "prettymapr",
  "raster",
  "rgdal",
  "rgeos",
  "sf",
  "shapefiles",
  "sp",
  "spatstat",
  "spex",
  "stplanr",
  "tigris",
  "tmap",
  "trajectories",
  # stats
  "agricolae",
  "biotools",
  "changepoint",
  "describer",
  "DescTools",
  "gam",
  "Kendall",
  "lmtest",
  "mgcv",
  "MuMIn",
  "outliers",
  "smatr",
  "statcheck",
  "stats",
  # modelling
  "blme",
  "brms",
  "bayesboot",
  "bayesm",
  "BayesSummaryStatLM",
  "boa",
  "CARBayes",
  "datarobot",
  "deeplearning",
  "gamlss.dist",
  "gbm",
  "glmmML",
  "glmmstan",
  "kernlab",
  "lasso2",
  "lme4",
  "MCMCpack",
  "modelr",
  "RecordLinkage",
  "rjags",
  "rstan",
  "rstanarm",
  "RWeka",
  "VGAM",
  "Zelig",
  "zic",
  "zoib",
  # utility
  "abind",
  "archive", # file archives and libarchive API
  "assertive", # readable check functions to ensure integrity
  "assertthat", # data assertions
  "assertr", # data assertions
  "base",
  "broom",
  "chunked", # chunk text files
  "compareDF", # compare data
  "csvy", #
  "daff", # diff, patch, and merge
  "data.table", # dplyr alternative
  "datacheck", # check integrity/consistency of data
  "datacheckr",
  "datapasta",
  "diffr",
  "digest",
  "dlstats",
  "dpmr", # data package manager
  "drat", # DRAT R Archive Template
  "DT", # data tables JS library API
  "dtupdate",
  "emojifont",
  "ensurer",
  "feather",
  "foreign",
  "formattable",
  "flora",
  "foreach",
  "formula.tools",
  "franc",
  "gapfill",
  "gdata",
  "gdtools",
  "geohash",
  "geojsonio",
  "githug",
  "git2r",
  "gmailr",
  "gsubfn",
  "haven",
  "Hmisc",
  "identifyr",
  "janitor",
  "jsonlite",
  "jqr",
  "kulife",
  "lambdaR",
  "latex2exp",
  "lessR",
  "lineprof",
  "liftr", # dockerize RMD
  "lintr",
  "listenv",
  "log4r",
  "loggr",
  "luzlogr",
  "magrittr",
  "mailR",
  "memoise",
  "methods",
  "mime",
  "miniCRAN",
  "MissingDataGUI",
  "muRL",
  "needs",
  "Nippon",
  "operator.tools",
  "openssl",
  "openxlsx",
  "pacman",
  "passwordrandom",
  "pbapply",
  "pdftools",
  "pforeach",
  "PKI",
  "pipeR",
  "plan",
  "purrr",
  "PythonInR",
  "random",
  "readr",
  "readxl",
  "redland",
  "reinstallr",
  "remoter",
  "rex",
  "Rgitbook",
  "RJSONIO",
  "rio",
  "rmdformats",
  "rmote",
  "RNeXML",
  "rlist",
  "rncl",
  "rprojroot",
  "rstack",
  "rversions",
  "SASxport",
  "seer",
  "session",
  "sparklyr",
  "splitstackshape",
  "statar",
  "stringi",
  "stringr",
  "sqldf",
  "tabplot",
  "tabulizer",
  "taxize",
  "tidyjson",
  "tidytext",
  "tidyxl",
  "tokenizers",
  "tutorial",
  "Unicode",
  "unixtools",
  "utils",
  "validate",
  "verification",
  "versions",
  "weathermetrics",
  "WriteXLS",
  "XLConnect",
  "xlsx",
  "ztable",
  # webdev
  "clarifai", # AI for image content and search
  "curl", # web client
  "downloader", # download via http and https/source URLs
  "feedeR", # RSS/Atom Feeds
  "gistr", # github gists
  "github", # github API
  "gh", # github API
  "googlesheets",
  "htmltab",
  "htmltidy",
  "httr",
  "jug", # web API for R fxns
  "opencpu", #
  "osmar",
  "overpass",
  "plumber", # API for packages
  "RCurl", # web client
  "rdrop2", # dropbox API
  "rjson", # JSON
  "RSelenium",
  "rvest",
  "scrapeR",
  "searchConsoleR", # google search
  "servr", # daemon servers for static sites
  "slackr", # slack API
  "selectr", # CSS -> XPath
  "stackoverflow", # stackoverflow API/Greatest Hits
  "trelloR", # trello API
  "twitteR", # Twitter API
  "webshot", # PhantomJS screenshots
  "whoami", # details
  "WikipediR", # MediaWiki API
  "XML", # XML
  "xml2", # XML2
  # misc
  "whoami",
  "datapasta",
  "googler",
  "googledrive",
  "googleAuthR",
  "attachment",
  "githubinstall",
  "archivist.github",
  "gh",
  "gistr",
  "source.gist",
  "projmgr",
  "piggyback",
  "anyLib",
  "whoami",
  "rawr",
  "furrr",
  "desc",
  "requirements",
  # github remotes
  "hrbrmstr/dtupdate",
  "benmarwick/wordcountaddin",
  "gadenbuie/regexplain",
  "jimhester/archive",
  "richfitz/syncr",
  "ThinkR-open/fcuk",
  "ThinkR-open/chameleon",
  "ThinkR-open/checkhelper",
  "ColinFay/dockerstats"
)

pkgs <- unique(pkgs)

pak::pak(c("pacman", "golem", "purrr"))
pacman::p_unlock()
golem::detach_all_attached()

results <- purrr::map(
  pkgs,
  purrr::safely(pak::pak),
  upgrade = FALSE,
  ask = FALSE,
  dependencies = TRUE
)

errors <- purrr::map_depth(results, 1, purrr::pluck, "error") %>%
  setNames(pkgs) %>%
  purrr::compact()

qs::qsave(list(results, errors), fs::path_home(paste0(".R/cache/", Sys.Date(), "-results.qs")))
