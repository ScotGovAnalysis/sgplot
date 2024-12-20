#' Return function to use sgplot colour palette
#'
#' @param palette Name of palette to use.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed.
#' @param colour_names Boolean value to indicate whether colour names should be
#' included.
#' @param palette_type Name of palette type to use. Defaults to "sg". For all
#' available palette types, run `available_palette_types()`.
#' @param error_call Environment to reference in error messages.
#'
#' @return Function with one argument, `n`.
#'
#' @noRd

sg_palette <- function(palette = "main",
                       reverse = FALSE,
                       colour_names = FALSE,
                       palette_type = "sg",
                       error_call = rlang::caller_env()) {

  check_palette(palette_type, palette, error_call = error_call)

  function(n) {
    pal <- get_colours(palette_type, palette, n, error_call = error_call)

    if (reverse) pal <- rev(pal)

    if (!colour_names) pal <- as.vector(pal)

    pal
  }

}


#' Get colours
#'
#' @description This function checks that the required number of colours are
#' available from the selected palette and palette type, and if so returns them.
#' If not, a helpful error is returned.
#'
#' @param palette_type,palette String.
#' @param n Number of colours required.
#'
#' @return Named character vector of colours, length `n`.
#'
#' @noRd

get_colours <- function(palette_type,
                        palette,
                        n,
                        error_call = rlang::caller_env()) {

  check_palette(palette_type, palette, error_call = error_call)

  all_palettes <- eval(parse(
    text = paste0("sgplot::", palette_type, "_colour_palettes")
  ))

  n_available <- length(all_palettes[[palette]])

  if (is.null(n)) n <- n_available

  # Use 'main2' if AF main palette used and only 2 colours required
  if (
    palette_type == "af" &&
      n == 2 &&
      palette != "main2" &&
      grepl("main", palette)
  ) {
    palette <- "main2"
    cli::cli_warn(c(
      "!" = "Using {.str main2} as only two colours are required."
    ))
  }

  # Error if more colours requested than exist in palette
  if (n > n_available) {
    ext_palettes <- grep("^main([5-9]|-extended)",
                         available_palettes(palette_type),
                         value = TRUE)

    cli::cli_abort(
      c(
        "x" = "{.arg {palette}} must contain at least {n} colours.",
        "i" = paste("The {.str {palette}} palette from the ",
                    "{.str {palette_type}} palette type",
                    "only contains {n_available} colours."),
        if (n > 4) {
          c("i" = paste("Accessibility guidance recommends a limit of four",
                        "colours per chart. If more than four colours are",
                        "required, first consider chart redesign."))
        },
        if (n > 4 & !is.null(ext_palettes)) {
          c("i" = paste("If it is essential to use more than four colours,",
                        "the {.str {ext_palettes}} palette{?s} can be used."))
        }
      ),
      call = error_call
    )
  }

  all_palettes[[palette]][seq_len(n)]

}
