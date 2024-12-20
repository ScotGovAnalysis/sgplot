#' @title Available palettes and palette types
#'
#' @param palette_type String.
#'
#' @return A character vector of available palettes or palette types.
#'
#' @examples
#' available_palette_types()
#' available_palettes("sg")
#'
#' @export

available_palettes <- function(palette_type) {

  check_palette_type(palette_type)

  vec_name <- paste0("sgplot::", palette_type, "_colour_palettes")

  names(eval(parse(text = vec_name)))

}

#' @export
#' @rdname available_palettes

available_palette_types <- function() {

  sgplot_data <- utils::data(package = "sgplot")$result[, "Item"]

  sgplot_palettes <- grep("_colour_palettes$", sgplot_data, value = TRUE)

  sub("_colour_palettes$", "", sgplot_palettes)

}


#' @title Check palettes and palette types
#'
#' @description Checks values against those available in
#' `available_palette_types()` and `available_palettes()`.
#'
#' @param palette_type,palette String.
#'
#' @return The value being checked is returned invisibly if the check is
#' successful. Otherwise the function will return an error.
#'
#' @examples
#' check_palette_type("sg")
#' check_palette("sg", "main")
#'
#' @export

check_palette <- function(palette_type, palette) {

  if (!palette %in% available_palettes(palette_type)) {
    cli::cli_abort(
      c("x" = paste("{.arg {palette}} is not an available",
                    "{.str {palette_type}} palette."),
        "i" = paste("Available palette{?s}:",
                    "{.str {available_palettes(palette_type)}}."))
    )
  } else {
    invisible(palette)
  }

}

#' @export
#' @rdname check_palette

check_palette_type <- function(palette_type) {

  if (!palette_type %in% available_palette_types()) {
    cli::cli_abort(
      c("x" = "{.arg {palette_type}} is not an available palette type.",
        "i" = "Available palette type{?s}: {.str {available_palette_types()}}.")
    )
  } else {
    invisible(palette_type)
  }

}
