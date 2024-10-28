#' Return function to use Scottish Government colour palette
#'
#' @param palette Name of palette to use.
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed.
#' @param colour_names Boolean value to indicate whether colour names should be
#' included.
#' @param palette_type Either `sg` to use Scottish Government palettes, `sss`
#' to use Social Security Scotland palettes or `af` to use Analysis Function
#' palettes. Defaults to `sg`.
#'
#' @noRd

sg_palette <- function(palette = "main",
                       reverse = FALSE,
                       colour_names = FALSE,
                       palette_type = c("sg", "sss", "af"),
                       error_call = rlang::caller_env(),
                       error_arg = rlang::caller_arg(palette)) {

  palette_type <- rlang::arg_match(palette_type)

  palette_list <- switch(
    palette_type,
    af  = sgplot::af_colour_palettes,
    sss = sgplot::sss_colour_palettes,
    sg  = sgplot::sg_colour_palettes
  )

  # Check valid palette name
  if (!palette %in% names(palette_list)) {
    cli::cli_abort(
      c("x" = paste("{.str {palette}} is not a valid palette name ",
                  "for {.str {palette_type}} palette type."),
        "i" = "Available palette{?s}: {.str {names(palette_list)}}."),
      call = error_call
    )
  }

  function(n) {
    n_available <- length(palette_list[[palette]])

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

    ext_palettes <- subset(
      names(palette_list),
      stringr::str_detect(names(palette_list), "^main([5-9]|-extended)")
    )

    # Error if more colours requested than exist in palette
    if (n > n_available) {
      cli::cli_abort(
        c(
          "x" = paste("{.arg {error_arg}} must contain at least",
                      "{n} colours."),
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

    pal <- palette_list[[palette]][seq_len(n)]

    if (reverse) pal <- rev(pal)

    if (colour_names) {
      pal
    } else {
      as.vector(pal)
    }
  }
}
