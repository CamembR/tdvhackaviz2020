tdvhackaviz2020
===============

This package contains *ready to use R data package** of the datasets provided by [ToulouseDataViz](https://toulouse-dataviz.fr/) in the frame of the [Hackaviz2020](https://github.com/ToulouseDataViz/Hackaviz2020).

This package contains the following datasets

- `nuitees`
- `capacites`
- `par_origines`
- Complements: Split the complements dataset in three datatesets
    - `comp_evenements`
    - `comp_departemets`
    - `comp_pays`
    
## Installation

```R

# Install the development version from GitHub

devtools::install_github("CamembR/tdvhackaviz2020")

# Use it

tdvhackaviz2020::par_origines

#  A tibble: 493,235 x 8
#    date       org   dest  volume vacances_org temp_midi meteo nb_evt
#    <date>     <chr> <chr>  <dbl>        <dbl>     <dbl> <dbl>  <dbl>
#  1 2018-01-01 01    09       169            1        12     0      0
#  2 2018-01-01 28    65       138            1         9     0      0
```

## Notes

- More information on [data packages](http://r-pkgs.had.co.nz/data.html).

-----

Please note that the data are provided by [ToulouseDataViz](https://toulouse-dataviz.fr/) and so **the terms of uses applies as defined in their repository**: [Hackaviz2020](https://github.com/ToulouseDataViz/Hackaviz2020).

## TODO

- [Tests](https://testthat.r-lib.org/)
