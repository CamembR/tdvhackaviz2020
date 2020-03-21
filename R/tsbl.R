library(tsibble)
library(lubridate)
library(dplyr)


#' \code{nuitees_td} dataset as a tsibble.
#'
#' Creates and return a tsibble dataset from \code{nuitees_td} with the \code{dep} defined as the key.
#'
#' @return a tsibble
#'
#' @examples
#' nuitees_tsbl()
#'
#' @export
nuitees_tsbl <- function() {
    nuitees_tsbl <- tdvhackaviz2020::nuitees_td %>%
        select(dep, date, nuitees) %>%
        as_tsibble(key = dep, index = date)
    nuitees_tsbl
}

#' \code{capacite_td} dataset as a tsibble.
#'
#' Creates and return a tsibble dataset from \code{capacite_td} with the \code{dep} defined as the key.
#'
#' @return a tsibble
#'
#' @examples
#' capacite_tsbl()
#'
#' @export
capacites_tsbl <- function() {
    start = ymd("2018-01-01")
    capacites_tsbl <- tdvhackaviz2020::capacites_sem_td %>%
        mutate(date = start + weeks(sem - 1)) %>% # Transforming week to date
        mutate(capa = capa / 7) %>% # Computing capa by week to capa by day
        select(dep, date, capa) %>%
        as_tsibble(key = dep, index = date)
    capacites_tsbl
}

#' \code{vacances_td} dataset as a tsibble.
#'
#' Creates and return a tsibble dataset from \code{vacances_td} with the \code{zone} defined as the key.
#'
#' @return a tsibble
#'
#' @examples
#' vacances_tsbl()
#'
#' @export
vacances_tsbl <- function() {
    vacances_tsbl <- tdvhackaviz2020::vacances_td %>%
        select(zone, date, vacances) %>%
        as_tsibble(key = zone, index = date)
    vacances_tsbl
}


#' Merge between \code{capacite_td} and \code{nuitees_td} datasets as a tsibble.
#'
#' Creates and return a tsibble dataset merge of \code{nuitees_tsbl} and \code{capacites_tsbl}
#' - \code{dep} defined as the key.
#' - \code{capa} for capacite
#' - \code{nuitees} for nuitees
#'
#' @return a tsibble
#'
#' @examples
#' tourists_tsbl()
#'
#' @export
tourists_tsbl <- function() {
    tdvhackaviz2020::nuitees_tsbl() %>%
        left_join(tdvhackaviz2020::capacites_tsbl()) %>%
        fill_gaps() %>%
        tidyr::fill(capa, .direction = "down")
}

