#' Return function to use Scottish Government colour palette
#'
#' @param palette Name of palette from `sg_colour_palettes`
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed
#' @param colour_names Boolean value to indicate whether colour names should be
#' included
#' @param palette_type Either `sg` to use Scottish Government palettes, or `af`
#' to use Analysis Function palettes. Defaults to `sg`.

sg_palette <- function(palette = "main",
                       reverse = FALSE,
                       colour_names = FALSE,
                       palette_type = c("sg", "af")) {

  palette_type <- match.arg(palette_type)

  palette_list <- get(paste0(palette_type, "_colour_palettes"))

  # Check valid palette name
  if (!palette %in% names(palette_list)) {
    cli::cli_abort(c(
      "x" = paste("`{palette}` is not a valid palette name ",
                   "in `{palette_type}_colour_palettes`.")
    ))
  }

  function(n) {
    n_available <- length(palette_list[[palette]])

    # Use 'main2' if AF main palette used and only 2 colours required
    if (palette_type == "af" &&
        n == 2 && palette != "main2" && grepl("main", palette)) {
      palette <- "main2"
      cli::cli_warn(c(
        "!" = "Using `main2` as only two colours are required."
      ))
    }

    ext_palettes <- subset(
      names(palette_list),
      stringr::str_detect(names(palette_list), "^main[5-9]")
    )

    # Error if more colours requested than exist in palette
    if (n > n_available) {
      cli::cli_abort(c(
        "x" = paste(
          "There are not enough colours available in the `{palette}`",
          "palette from `{palette_type}_colour_palettes`",
          "({n_available} available)."
        ),
        "i" = paste(
          "Accessibility guidance recommends a limit of four",
          "colours per chart. If more than four colours are",
          "required, first consider chart redesign. If it is",
          "essential to use more than four colours, the {ext_palettes}",
          "palette{?s} can be used."
        )
      ))
    }

    pal <- palette_list[[palette]][seq_len(n)]

    if (reverse) pal <- rev(pal)

    if (colour_names) {
      pal
    } else {
      as.vector(pal)
    }
  }
}
