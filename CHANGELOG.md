Changelog
=========

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.4.2] - 2020-03-15

### Fixed

- `par_origines_td` fixed duplicates -> see [issue #2](https://github.com/ToulouseDataViz/Hackaviz2020/issues/2).
  Fixed by keeping only the `last` value.

```R
# Before the fix duplicated lines 2 lines for each day between GB and 11.

par_origines_td %>% group_by(date, dep_org, dep_dest) %>% summarise(count = n()) %>% filter(count > 1)

#  A tibble: 365 x 4
#  Groups:   date, dep_org [365]
#   date       dep_org dep_dest count
#   <date>     <fct>   <fct>    <int>
#  1 2018-01-01 GB      11           2
#  2 2018-01-02 GB      11           2
#  3 2018-01-03 GB      11           2
```

## [0.4.1] - 2020-03-15

### Fixed

- `nuitees_td` transformed `0` to `NA`.

```R
# Before the fix

tdvhackaviz2020::nuitees_td %>%
    filter(nuitees == 0) %>%
    group_by(date) %>%
    summarise(count = n())

#  A tibble: 2 x 2
#  date       count
#  <date>     <int>
#  1 2018-08-29    13
#  2 2018-12-03    13
```

## [0.4.0] - 2020-03-15

### Added

- `par_origines_td` tidy version of `par_origines` dataset.

## [0.3.2] - 2020-03-15

### Fixed

- `dep` are now homogenously represented as `factors` in all datasets.

## [0.3.1] - 2020-03-15

### Fixed

- `capacites_sem_td` weeks are numbers to be consistent with `week()` function.

## [0.3.0] - 2020-03-15

### Added

- Tidy version of `capacites` -> `capacites_td` and `capacites_sem_td`

## [0.2.0] - 2020-03-15

### Added

- Tidy version of `nuitees` -> `nuitees_td`

## [0.1.1] - 2020-03-14

### Fixed

- Capacite 
    - all columns to lower case.
    - `dpt` is now `dpt_<num dpt>` to be homogeneous
    - Fix encoding

## [0.1.0] - 2020-03-14

### Added

- First version.
