#' Apply min-max transformation
#' @param 
min_max <- function(data, variable.to.minmax, local=FALSE, key){
  
  if (local=FALSE){
    vtm <- eval(pars$data)[, as.numeric(pars$variable.to.minmax)]
    range.vtm <- range(vtm)
    data$min.max <- (vtm - range.vtm[1])(range.vtm[2] - range.vtm[1])
    tbl <- as_tibble(data)
  } else{
    
    tbl <- pars$data %>% 
      group_by(pars$key) %>%
      summarize(min = ,
                max = ,
                min.max = )
    
  }
  
  tbl
}