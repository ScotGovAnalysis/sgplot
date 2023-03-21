#' Return function to use Scottish Government colour palette
#'
#' @param palette Name of palette from `sg_colour_palettes`
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed
#' @param colour_names Boolean value to indicate whether colour names should be
#' included

sg_palette <- function(palette = "main",
                       reverse = FALSE,
                       colour_names = FALSE) {

  # Check valid palette name
  if (!palette %in% names(sgplot::sg_colour_palettes)) {
    cli::cli_abort(c(
      "x" = paste0("`", palette, "` is not a valid palette name.")
    ))
  }

  function(n) {
    n_available <- length(sgplot::sg_colour_palettes[[palette]])

    # Use 'main2' if main palette used and only 2 colours required
    if (n == 2 && palette != "main2" && grepl("main", palette)) {
      palette <- "main2"
      cli::cli_warn(c(
        "!" = "Using `main2` as only two colours are required."
      ))
    }

    # Error if more colours requested than exist in palette
    if (n > n_available) {
      cli::cli_abort(c(
        "x" = paste0(
          "There are not enough colours available in the `",
          palette, "` palette (", n_available, " available)."
        ),
        "i" = paste(
          "Accessibility guidance recommends a limit of four",
          "colours per chart. If more than four colours are",
          "required, first consider chart redesign. If it is",
          "essential to use more than four colours, the `main6`",
          "palette can be used."
        )
      ))
    }

    pal <- sgplot::sg_colour_palettes[[palette]][seq_len(n)]

    if (reverse) pal <- rev(pal)

    if (colour_names) {
      pal
    } else {
      as.vector(pal)
    }
  }
}
