
<!-- README.md is generated from README.Rmd. Please edit that file -->
# Salem <img src="man/figures/logo.png" align="right" height="250" />

<!-- badges: start -->
<!-- badges: end -->
The goal of salem is to provide access to data and other materials related to the Salem Witchcraft Trials which took place in Salem, Massachusetts and the surrounding region in 1692. It is based on the work of historian Richard Latner which is available at [The Salem Witchcraft Site](https://www.tulane.edu/~salem/).

One of the important goals of this project is to make this data available for educational purposes, whether in history, statistics, sociology or other areas. The "Recreating the Website Analyses" describes and provides basic examples of how to reproduce the analyses on the original site. This is merely a jumping off point for many possible analyses that these data sets can be used for. In future work we will be adding advice to instructors who would like to work with this data in courses.

## Installation

We're on CRAN!

``` r
install.packages("salem")
#> installing the source package 'salem'
```

You can install the development version from github. But there won't be much difference ... and this website is where educational materials will be posted.

``` r
# install.packages("devtools")
devtools::install_github("elinw/salem")
```

The raw data from the website and the code used to convert it to R data frames is available in the rawdata folder of this respository.

<a title="W.P. Upham, Public domain, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Salem_Village_-_map_of_-_Project_Gutenberg_eText_17845.jpg"><img width="512" alt="Salem Village - map of - Project Gutenberg eText 17845" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Salem_Village_-_map_of_-_Project_Gutenberg_eText_17845.jpg/512px-Salem_Village_-_map_of_-_Project_Gutenberg_eText_17845.jpg"></a>

## Contributing

Although this is a fairly well-defined package with a specific purpose, contributions are welcome. Please submit issues and pull requests at our github repository. Additional relevant, appropriately licensed data sets will be considered for inclusion directly or through APIs on a case by case basis. Potential supplemental materials such as Shiny Apps, tutorials or vignettes may also be considered.
