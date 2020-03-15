#' @importFrom tibble tibble
NULL

#' Nuitees.
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"nuitees"

#' Tidy version of the nuitees dataset.
#'
#' The dataset has now only one variable \code{nuitees} and observations are made by \code{date} and \code{dep}.
#' In consequence \code{total_occitanie} has been removed since it is a \code{sum} of all the \code{dep} at a \code{date} (see examples).
#'
#' @examples
#' nuitees_td
#'
#' # A tibble: 4,745 x 3
#' date       dep    nuitees
#' <date>     <chr>    <dbl>
#' 1 2018-01-01 dpt_09   36427
#' 2 2018-01-01 dpt_11   60093
#'
#' # To get total_occitanie
#' nuitees_td %>%
#'   group_by(date) %>%
#'   summarise(total_occitanie = sum(nuitees))
#'
#' # A tibble: 365 x 2
#' date       total_occitanie
#' <date>               <dbl>
#' 1 2018-01-01          927930
#' 2 2018-01-02          444144
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"nuitees_td"

#' Capacites.
#'
#' @source <https://github.com/ToulouseDataViz/Hackaviz2020>
"capacites"

#' Par Origines.
#'
"par_origines"

#' Complements / Evenements
#'
#' @source <https://github.com/ToulouseDataViz/Hackaviz2020>
"comp_evenements"

#' Complements / Departements
#'
#' @source <https://github.com/ToulouseDataViz/Hackaviz2020>
"comp_departements"

#' Complements / pays
#'
#' @source <https://github.com/ToulouseDataViz/Hackaviz2020>
"comp_pays"
