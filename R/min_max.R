#' Apply min-max transformation
#' @param data tibble that contains cases, groups
#' @param variable.to.minmax the variable that we want to tranform using the min-max transformation
#' @param local TRUE if you need to apply local minmax transformation
#' @param group.var variables that you need to create group-wise
#' @return tibble with minmax transformed applied
#' @importFrom rlang enquo
#' @export
min_max <- function(data, variable.to.minmax, local=FALSE, group.var){
  
  if (local==FALSE) {
    
    cases = as.name(variable.to.minmax)
    
    data.tbl <- data |> 
      dplyr::mutate(
        min.cases = min(!!enquo(cases), na.rm=TRUE),
        max.cases = max(!!enquo(cases), na.rm=TRUE),
        minmax.cases = (!!enquo(cases) - min(!!enquo(cases),na.rm=TRUE))/(max(!!enquo(cases), na.rm=TRUE) - min(!!enquo(cases), na.rm=TRUE))
      )
    
  } else {
    
    group_var <- as.name(group.var)
    cases = as.name(variable.to.minmax)
    
    data.tbl <- data |> dplyr::group_by(!!enquo(group_var)) |>
      dplyr::mutate(
        min.group = min(!!enquo(cases), na.rm=TRUE),
        max.group = max(!!enquo(cases), na.rm=TRUE),
        minmax.group = (!!enquo(cases) - min(!!enquo(cases), na.rm=TRUE))/(max(!!enquo(cases), na.rm=TRUE) - min(!!enquo(cases), na.rm=TRUE))
      
      )
    }
  
  data.tbl
}
#'@examples
#' library(tibble)
#' value <- c(rnorm(20, mean=0), 
#'           rnorm(20, mean=20))
#' key <- c(rep(1, 20), rep(2, 20))
#' tbl <- tibble(values=value, keys=key)
#'ex1 <- min_max(tbl, "values", local=TRUE, "keys")
#'ex1
#'ex2 <- min_max(tbl, "values",local=FALSE, "keys")
#'ex2
