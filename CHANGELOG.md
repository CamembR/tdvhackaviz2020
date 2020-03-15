Changelog
=========

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
