
[![Travis build status](https://travis-ci.org/lionel-/reggen.svg?branch=master)](https://travis-ci.org/lionel-/reggen)

```{r}
library("reggen")

mygeneric.data.frame <- function(x) stop("Should not be called!")
mygeneric.character <- function(x) stop("Should not be called!")

mygeneric(mtcars)
#> Error in UseMethod("mygeneric") :
#>   no applicable method for 'mygeneric' applied to an object of class "data.frame"

mygeneric("mtcars")
#> Registered character method
```

The downside is extra call frames. The frame #3 below could be
avoided. It might be possible to get rid of #2 in R 3.5 thanks to new
`on.exit()` semantics.

```{r}
traceback()
#> 6: stop("bam") at zzz.R#21
#> 5: mygeneric.character(...) at zzz.R#4
#> 4: gen(...) at eval.R#97
#> 3: eval_bare(quote(gen(...)), env) at reggen.R#6
#> 2: use_registered(mygeneric_impl, ...) at zzz.R#15
#> 1: mygeneric("mtcars")
```

In general it seems this should be an argument to `UseMethod()`.

```{r}
mygeneric <- function(...) {
  UseMethod("mygeneric", lexical = FALSE)
}
```
