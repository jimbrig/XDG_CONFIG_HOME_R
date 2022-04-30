#  ------------------------------------------------------------------------
#
# Title : usethis options script
#    By : Jimmy Briggs
#  Date : 2022-03-18
#
#  ------------------------------------------------------------------------

# install if necessary
# if (!("usethis" %in% rownames(utils::installed.packages()))) {
#   install.packages("usethis")
# }

# DESCRIPTION defaults
options(
  usethis.full_name = "Jimmy Briggs",
  usethis.protocol = "ssh",
  usethis.description = list(
    `Authors@R` = 'person("Jimmy", "Briggs",
                         email = "jimmy.briggs@jimbrig.com",
                         role = c("aut", "cre"),
                         comment = c(ORCID = "0000-0002-7489-8787"))',
    License = "MIT + file LICENSE",
    Language =  "en-US"
  )
)
