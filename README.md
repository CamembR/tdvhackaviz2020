tdvhackaviz2020
===============

This package contains **ready to use R data package** of the datasets provided by [ToulouseDataViz](https://toulouse-dataviz.fr/) in the frame of the [Hackaviz2020](https://github.com/ToulouseDataViz/Hackaviz2020).

This package contains the following datasets with two flavors original and tidy suffixed by `_td`:

- `nuitees` / `nuitees_td`
- `capacites`
    - `capacites_td`: whithout weekly data (`pop` and `hbgt_*`)
    - `capacites_sem_td`: with only weekly data `capa` per week (`sem_*`)
- `par_origines` / `par_origines_td`
- Complements: Split the complements dataset in three datatesets
    - `comp_evenements`
    - `comp_departemets`
    - `comp_pays`

It also contains **time series data** formatted as a [tsibble](https://tsibble.tidyverts.org/).

## Installation and usage

```R

# Install the development version from GitHub

devtools::install_github("CamembR/tdvhackaviz2020")

# Use tidy datasets

tdvhackaviz2020::nuitees_td

# A tibble: 4,745 x 3
# date       dep   nuitees
# <date>     <fct>   <dbl>
# 1 2018-01-01 09      36427
# 2 2018-01-01 11      60093

# Use tsibble

tdvhackaviz2020::tourists_tsbl() %>%
  group_by_key() %>%
  index_by(year_month = ~ year(.)) %>% # monthly aggregates
  summarise(
    capa = mean(capa, na.rm = TRUE),
    nuitees = mean(nuitees, na.rm = TRUE),
    diff = capa - nuitees
  ) %>% 
  arrange(desc(nuitees)) %>% 
  top_n(3, nuitees)

# A tsibble: 3 x 5 [?]
# Key:       dep [3]
# dep   year_month    capa nuitees   diff
# <fct>      <dbl>   <dbl>   <dbl>  <dbl>
# 1 34          2018 135983. 137096. -1112.
# 2 66          2018  86810.  87599.  -789.
# 3 31          2018  78069.  78823.  -754.
```

## Tidy version

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
