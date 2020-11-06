
<!-- README.md is generated from README.Rmd. Please edit that file -->
# Salem <img src="man/figures/logo.png" align="right" height="139" />

<!-- badges: start -->
<!-- badges: end -->
The goal of salem is to provide access to data and other materials related to the Salem Witchcraft Trials which took place in Salem, Massachusetts and the surrounding region in 1692. It is based on the work of historian Richard Latner which is available at [The Salem Witchcraft Site](https://www.tulane.edu/~salem/).

## Installation

We're on CRAN!

``` r
install.packages("salem")
```

If you want to do maps you should also install `sf`.

You can install the development version from github. Not much difference though.

``` r
# install.packages("devtools")
devtools::install_github("elinw/salem")
```

The raw data from the website and the code used to convert it to R data frames is available in the rawdata folder of this respository.

<a title="W.P. Upham, Public domain, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Salem_Village_-_map_of_-_Project_Gutenberg_eText_17845.jpg"><img width="512" alt="Salem Village - map of - Project Gutenberg eText 17845" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Salem_Village_-_map_of_-_Project_Gutenberg_eText_17845.jpg/512px-Salem_Village_-_map_of_-_Project_Gutenberg_eText_17845.jpg"></a>

## Contributing

Although this is a fairly well-defined package with a specific purpose, contributions are welcome. Please submit issues and pull requests at our github repository. Additional relevant, appropriately licensed data sets will be considered for inclusion directly or through APIs on a case by case basis. Potential supplemental materials such as Shiny Apps, tutorials or vignettes may also be considered.
