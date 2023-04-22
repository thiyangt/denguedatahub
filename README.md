
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![R-CMD-check](https://github.com/thiyangt/denguedatahub/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/thiyangt/denguedatahub/actions/workflows/R-CMD-check.yaml)

# denguedatahub <img src="hexsticker/logo.png" align="right" height="180"/>

The goal of `denguedatahub` is to provide the research community with a
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
srilanka_weekly_data
#> # A tibble: 21,960 × 6
#>     year  week start.date end.date   district    cases
#>    <dbl> <dbl> <date>     <date>     <chr>       <dbl>
#>  1  2006    52 2006-12-23 2006-12-29 Colombo        71
#>  2  2006    52 2006-12-23 2006-12-29 Gampaha        12
#>  3  2006    52 2006-12-23 2006-12-29 Kalutara       12
#>  4  2006    52 2006-12-23 2006-12-29 Kandy          20
#>  5  2006    52 2006-12-23 2006-12-29 Matale          4
#>  6  2006    52 2006-12-23 2006-12-29 NuwaraEliya     1
#>  7  2006    52 2006-12-23 2006-12-29 Galle           1
#>  8  2006    52 2006-12-23 2006-12-29 Hambanthota     1
#>  9  2006    52 2006-12-23 2006-12-29 Matara         11
#> 10  2006    52 2006-12-23 2006-12-29 Jaffna          0
#> # ℹ 21,950 more rows
```

## World

``` r
world_annual
#> # A tibble: 6,750 × 4
#>    entity      code   year incidence
#>    <chr>       <chr> <dbl>     <dbl>
#>  1 Afghanistan AFG    1990     23371
#>  2 Afghanistan AFG    1991     25794
#>  3 Afghanistan AFG    1992     29766
#>  4 Afghanistan AFG    1993     32711
#>  5 Afghanistan AFG    1994     34268
#>  6 Afghanistan AFG    1995     35823
#>  7 Afghanistan AFG    1996     37397
#>  8 Afghanistan AFG    1997     38862
#>  9 Afghanistan AFG    1998     39660
#> 10 Afghanistan AFG    1999     39987
#> # ℹ 6,740 more rows
```
