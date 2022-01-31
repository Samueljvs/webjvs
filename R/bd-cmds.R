

library(blogdown)

# new_site(theme = "wowchemy/starter-academic")



serve_site()

# blogdown::new_post(title = "Hi Hugo", 
#                    ext = '.Rmarkdown', 
#                    subdir = "post")


# blogdown::config_Rprofile() 

# 
# options(
#   # to automatically serve the site on RStudio startup, set this option to TRUE
#   blogdown.serve_site.startup = FALSE,
#   # to disable knitting Rmd files on save, set this option to FALSE
#   blogdown.knit.on_save = FALSE     <- change
#   blogdown.author = "Alison Hill",  <- add
#   blogdown.ext = ".Rmarkdown",      <- add
#   blogdown.subdir = "post"          <- add
# )


file.edit(".gitignore")
blogdown::check_gitignore()
blogdown::check_content()

## Check site
##
  blogdown::check_hugo()



