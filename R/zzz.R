.onLoad <- function(libname, pkgname) {

  # Add Roboto font from Google
  try(
    sysfonts::font_add_google(name = "Roboto", family = "sgplot-roboto"),
    silent = TRUE
  )

}
