

mygeneric_impl <- function(...) {
  UseMethod("mygeneric")
}

#' A pure registry-dispatch generic
#'
#' @param ... Generic arguments.
#' @export
#' @examples
#' mygeneric.character <- function(...) stop("Never Called")
#' mygeneric("foo")
mygeneric <- function(...) {
  return(use_registered(mygeneric_impl, ...))
  UseMethod("mygeneric") # So roxygen recognises the generic
}

#' @export
mygeneric.character <- function(x, ...) {
  cat("Registered character method\n")
}
