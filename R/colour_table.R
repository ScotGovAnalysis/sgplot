#' @title Create \code{gt} table of colour palette
#'
#' @param pal Named vector of colour palette;
#' e.g. \code{sgplot::sg_colour_palettes[["main"]]}
#'
#' @return An object of class \code{gt_tbl}.

colour_table <- function(pal) {

  tibble::enframe(pal) |>
    dplyr::mutate(example = "") |>
    dplyr::mutate(value = factor(
      pal,
      ordered = TRUE,
      levels = unname(pal)
    )) |>
    gt::gt() |>
    gt::data_color(
      columns = .data$value,
      target_columns = .data$example,
      fn = scales::col_factor(
        palette = pal,
        domain = NULL
      )) |>
    gt::cols_width(
      name ~ gt::px(110),
      value ~ gt::px(100),
      example ~ gt::px(150)
    ) |>
    gt::cols_align(
      align = "left",
      columns = dplyr::everything()
    ) |>
    gt::cols_label(
      name = "Colour name",
      value = "Hex code",
      example = "Example of colour"
    )

}
