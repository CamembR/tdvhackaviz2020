tdvhackaviz2020
===============

This package contains **ready to use R data package** of the datasets provided by [ToulouseDataViz](https://toulouse-dataviz.fr/) in the frame of the [Hackaviz2020](https://github.com/ToulouseDataViz/Hackaviz2020).

This package contains the following datasets with two flavors original and tidy suffixed by `_td`:

- `nuitees` / `nuitees_td`
- `capacites`
- `par_origines`
- Complements: Split the complements dataset in three datatesets
    - `comp_evenements`
    - `comp_departemets`
    - `comp_pays`
    
## Installation and usage

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

## Tidy version

This package also proposes tidy versions of each dataset (suffixed by `_td`).

### Definition

> Tidy data is a standard way of mapping the meaning of a dataset to its structure. A dataset is messy or tidy depending on how rows, columns and tables are matched up with observations, variables and types. 
In **tidy data**:
>
> 1. Each variable forms a column.
> 2. Each observation forms a row.
> 3. Each type of observational unit forms a table.
>
> --- <cite>[Tidy data vignette](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html)</cite>

See `help` for description and usage.

```R
?nuitees_td

nuitees_td

# A tibble: 4,745 x 3
date       dep    nuitees
<date>     <chr>    <dbl>
1 2018-01-01 dpt_09   36427
2 2018-01-01 dpt_11   60093

# To get total_occitanie
nuitees_td %>%
  group_by(date) %>%
  summarise(total_occitanie = sum(nuitees))

# A tibble: 365 x 2
date       total_occitanie
<date>               <dbl>
1 2018-01-01          927930
2 2018-01-02          444144
```

## Notes

- More information on [data packages](http://r-pkgs.had.co.nz/data.html).
- [Tidy data vignette](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html)

-----

Please note that the data are provided by [ToulouseDataViz](https://toulouse-dataviz.fr/) and so **the terms of uses applies as defined in their repository**: [Hackaviz2020](https://github.com/ToulouseDataViz/Hackaviz2020).

## TODO

- [Tests](https://testthat.r-lib.org/)
