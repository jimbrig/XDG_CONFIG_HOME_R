#  ------------------------------------------------------------------------
#
# Title : Blogdown R Package Options
#    By : Jimmy Briggs
#  Date : 2022-03-18
#
#  ------------------------------------------------------------------------

# install if necessary
# if (!("blogdown" %in% rownames(utils::installed.packages()))) {
#   install.packages("blogdown")
# }

# blogdown - https://bookdown.org/yihui/blogdown/global-options.html
options(
  blogdown.author = "Jimmy Briggs",
  blogdown.ext = ".Rmd",
  blogdown.insertimage.usebaseurl = TRUE
)
