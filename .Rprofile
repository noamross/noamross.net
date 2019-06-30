
if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

options(
  blogdown.ext = ".md",
  blogdown.author = "Noam Ross",
  blogdown.subdir = file.path("musings", as.character(Sys.Date(), "%Y")),
  blogdown.yaml.empty = TRUE
  )

Sys.setenv(
  "HERE"=here::here()
)

# End .Rprofile
