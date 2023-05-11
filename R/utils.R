#' @title Convert millimetres to inches
#'
#' @param x Numeric value in millimetres
#'
#' @return A numerical value in inches
#'
#' @examples mm_to_inch(100)
#'
#' @export

mm_to_inch <- function(x) {

  if(!inherits(x, "numeric")) {
    cli::cli_abort("x must be numeric.")
  }

  x / 25.4

}
