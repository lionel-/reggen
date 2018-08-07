
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
