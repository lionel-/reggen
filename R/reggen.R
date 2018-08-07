#' @import rlang
NULL

#' Pure registry dispatch
#'
#' @param gen A generic function to invoke.
#' @param ... Arguments passed to the generic function.
#' @export
use_registered <- function(gen, ...) {
  # Evaluate generic in a child of the empty environment with
  # forwarded dots. This zaps lexical dispatch in the caller
  # environment.
  env <- env(empty_env(), ... = get("..."), gen = gen)

  # Could .Call() into Rf_eval() to avoid one extra call frame
  eval_bare(quote(gen(...)), env)
}


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
