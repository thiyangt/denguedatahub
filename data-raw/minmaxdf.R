#https://stackoverflow.com/questions/51358484/using-variable-names-for-dplyr-inside-function
library(tidyverse)
sum1 <- function(df, group_var,x,y) {
  
  group_var <- enquo(group_var)
  
  x = as.name(x)
  y = as.name(y)
  
  df.temp<- df %>%
    group_by(!!group_var) %>%
    mutate(
      sum = !!enquo(x)+!!enquo(y)
    )
  
  return(df.temp)
}

df <- tibble(
  g1 = c(1, 2, 3, 4, 5),
  a = sample(5),
  b = sample(5)
)
df
test <- sum1(df, "g1", "a", "b")

View(test)



##


library(tibble)
value <- c(rnorm(20, mean=0), 
           rnorm(20, mean=20))
key <- c(rep(1, 20), rep(2, 20))
tbl <- tibble(values=value, keys=key)
#View(tbl)


new_column2 <- function(df, value, key){
  v <- df[[deparse(substitute(value))]]
  k <- df[[deparse(substitute(key))]]
  
  rangev <- range(v)
  min.max <- (v-rangev[1])/(rangev[2] - rangev[1])
  df$min.max <- min.max
  df
}

new_column2(tbl, values, keys)

## correct
new_column3 <- function(df, value, key){
  v <- df[[deparse(substitute(value))]]
  k <- df[[deparse(substitute(key))]]
  
  rangev <- range(v)
  min.max <- (v-rangev[1])/(rangev[2] - rangev[1])
  df$min.max <- min.max
  #df
  df %>% dplyr::group_by_at(key) 

}

new_column3(tbl, values, keys)

new_column4 <- function(df, value, key){
  
  group_var <- enquo(key)
  
  cases = as.name(value)
 
  
 # rangev <- range(df$value, na.rm = TRUE)
 # min.max <- (df$value-rangev[1])/(rangev[2] - rangev[1])
 # df$min.max <- min.max
  df %>% dplyr::group_by(!!group_var) %>% 
    mutate(
      mean.group = mean(!!enquo(cases))
    )
}
aa <- new_column4(tbl, "values", "keys")
View(aa)
