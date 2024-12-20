#' @title Available palettes and palette types
#'
#' @param palette_type String.
#' @param error_call Environment to reference in error messages.
#'
#' @return A character vector of available palettes or palette types.
#'
#' @examples
#' available_palette_types()
#' available_palettes("sg")
#'
#' @export

available_palettes <- function(palette_type, error_call = rlang::caller_env()) {

  check_palette_type(palette_type, error_call = error_call)

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
#' @param error_call Environment to reference in error messages.
#'
#' @return The value being checked is returned invisibly if the check is
#' successful. Otherwise the function will return an error.
#'
#' @examples
#' check_palette_type("sg")
#' check_palette("sg", "main")
#'
#' @export

check_palette <- function(palette_type,
                          palette,
                          error_call = rlang::caller_env()) {

  if (!palette %in% available_palettes(palette_type, error_call = error_call)) {
    cli::cli_abort(
      c("x" = paste("{.arg {palette}} is not an available",
                    "{.str {palette_type}} palette."),
        "i" = paste("Available palette{?s}:",
                    "{.str {available_palettes(palette_type)}}.")),
      call = error_call
    )
  } else {
    invisible(palette)
  }

}

#' @export
#' @rdname check_palette

check_palette_type <- function(palette_type,
                               error_call = rlang::caller_env()) {

  if (!palette_type %in% available_palette_types()) {
    cli::cli_abort(
      c("x" = "{.arg {palette_type}} is not an available palette type.",
        "i" = paste("Available palette type{?s}:",
                    "{.str {available_palette_types()}}.")),
      call = error_call
    )
  } else {
    invisible(palette_type)
  }

}
