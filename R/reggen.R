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
  env <- env(empty_env(), ... = get("..."))
  eval_bare(expr((!!gen)(...)), env)
}
