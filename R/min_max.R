#' Apply min-max transformation
#' @param 
min_max <- function(data, variable.to.minmax, local=FALSE, group.var){
  
  group_var <- enquo(group.var)
  
  x = as.name(x)
  y = as.name(y)
  
  
  
  if (local=FALSE){
    range.vtm <- range(variable.to.minmax)
    data$min.max <- (variable.to.minmax - range.vtm[1])(range.vtm[2] - range.vtm[1])
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