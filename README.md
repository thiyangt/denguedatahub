
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
install.packages("denguedatahub")
```

``` r
# install.packages("devtools")
devtools::install_github("thiyangt/denguedatahub")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(tsibble)
#> 
#> Attaching package: 'tsibble'
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, union
```

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
#>   <dbl> <dbl> <date>     <date>     <chr>       <dbl>
#> 1  2006    52 2006-12-23 2006-12-29 Colombo        71
#> 2  2006    52 2006-12-23 2006-12-29 Gampaha        12
#> 3  2006    52 2006-12-23 2006-12-29 Kalutara       12
#> 4  2006    52 2006-12-23 2006-12-29 Kandy          20
#> 5  2006    52 2006-12-23 2006-12-29 Matale          4
#> 6  2006    52 2006-12-23 2006-12-29 NuwaraEliya     1
```

## World

``` r
library(tidyverse)
world_annual |>
  filter(region=="Afghanistan") |>
  head()
#>       long      lat group order      region subregion code year incidence
#> 1 74.89131 37.23164     2    12 Afghanistan      <NA>  AFG 1990     23371
#> 2 74.89131 37.23164     2    12 Afghanistan      <NA>  AFG 1991     25794
#> 3 74.89131 37.23164     2    12 Afghanistan      <NA>  AFG 1992     29766
#> 4 74.89131 37.23164     2    12 Afghanistan      <NA>  AFG 1993     32711
#> 5 74.89131 37.23164     2    12 Afghanistan      <NA>  AFG 1994     34268
#> 6 74.89131 37.23164     2    12 Afghanistan      <NA>  AFG 1995     35823
#>   dengue.present
#> 1            yes
#> 2            yes
#> 3            yes
#> 4            yes
#> 5            yes
#> 6            yes
```
