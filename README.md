
<!-- README.md is generated from README.Rmd. Please edit that file -->

# denguedatahub <img src="hexsticker/logo.png" align="right" height="180"/>

<!-- badges: start -->
<!-- badges: end -->

The goal of denguedatahub is to provide the research community with a
unified dataset by collecting worldwide dengue-related data, merged with
exogenous variables helpful for a better understanding of the spread of
dengue and the reproducibility of research.

![](hexsticker/profile.png)

Check out the website at <https://denguedatahub.netlify.app/>

## Installation

You can install the development version of denguedatahub from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("thiyangt/denguedatahub")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(denguedatahub)
head(level_of_risk)
#> # A tibble: 6 × 3
#>   country      level_of_risk       region
#>   <fct>        <fct>               <fct> 
#> 1 Angola       Sporadic/Uncertain  Africa
#> 2 Benin        Sporadic/Uncertain  Africa
#> 3 Burkina Faso Frequent/Continuous Africa
#> 4 Burundi      Sporadic/Uncertain  Africa
#> 5 Cameroon     Sporadic/Uncertain  Africa
#> 6 Cape Verde   Sporadic/Uncertain  Africa
```

## Sri Lanka Weekly Dengue Cases

``` r
head(srilanka_weekly_data)
#> # A tibble: 6 × 6
#>    year  week start.date end.date   district    cases
#>   <int> <int> <IDate>    <IDate>    <chr>       <int>
#> 1  2006    52 2006-12-23 2006-12-29 Colombo        71
#> 2  2006    52 2006-12-23 2006-12-29 Gampaha        12
#> 3  2006    52 2006-12-23 2006-12-29 Kalutara       12
#> 4  2006    52 2006-12-23 2006-12-29 Kandy          20
#> 5  2006    52 2006-12-23 2006-12-29 Matale          4
#> 6  2006    52 2006-12-23 2006-12-29 NuwaraEliya     1
```

## Obtain dengue data from weekly epidemiological reports published by [Epidemiology Unit, Ministry of Health, Sri Lanka](https://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en)

``` r
ad.list <- get_addresses("http://www.epid.gov.lk/web/index.php?option=com_content&view=article&id=148&Itemid=449&lang=en")
wer2023url <- filter_year_wer(2023, ad.list[1:9])
data2023 <- convert_srilanka_wer_to_tidy(year=2023, url.part2=wer2023url, 
start.date.first = "2022-12-31",
end.date.first = "2023-01-06",
start.date.last = "2023-01-28", 
end.date.last = "2023-02-03",
week.no=c(52, 1:4))
data2023
#> # A tibble: 130 × 6
#>     year  week start.date end.date   district    cases
#>    <dbl> <dbl> <date>     <date>     <chr>       <dbl>
#>  1  2023    52 2022-12-31 2023-01-06 Colombo        25
#>  2  2023    52 2022-12-31 2023-01-06 Gampaha        23
#>  3  2023    52 2022-12-31 2023-01-06 Kalutara       74
#>  4  2023    52 2022-12-31 2023-01-06 Kandy          50
#>  5  2023    52 2022-12-31 2023-01-06 Matale         25
#>  6  2023    52 2022-12-31 2023-01-06 NuwaraEliya     3
#>  7  2023    52 2022-12-31 2023-01-06 Galle          28
#>  8  2023    52 2022-12-31 2023-01-06 Hambantota     13
#>  9  2023    52 2022-12-31 2023-01-06 Matara         22
#> 10  2023    52 2022-12-31 2023-01-06 Jaffna         12
#> # ℹ 120 more rows
```
