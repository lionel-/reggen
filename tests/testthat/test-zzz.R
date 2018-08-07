
context("zzz")

test_that("lexically scoped methods are not dispatched on", {
  mygeneric.data.frame <- function(x) stop("Should not be called!")
  expect_error(mygeneric(mtcars), "no applicable method")

  mygeneric.character <- function(x) stop("Should not be called!")
  expect_output(mygeneric("string"), "Registered character method")
})
