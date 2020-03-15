#' @importFrom tibble tibble
NULL

# ---- Nuitees ----

#' Nuitees.
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"nuitees"

#' Tidy version of the \code{nuitees} dataset.
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

# ---- Capacites ----

#' Capacites.
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"capacites"

#'  Tidy version of part of the \code{capacite} dataset limited to the not weekly data \code{pop} and \code{hbgt_*} per \code{dep}.
#'
#' Total has been removed since it can be computed by summing all the columns.
#' @examples
#' capacites_td
#'
#' # A tibble: 13 x 6
#'  dep        pop hbgt_collectif hbgt_locatif hbgt_plein_air hbgt_hotel
#'  <glue>   <dbl>          <dbl>        <dbl>          <dbl>      <dbl>
#'  1 dpt_09  152611            187         2972           6337       1138
#'  2 dpt_11  368323          11534        21106          35451       7662
#'  3 dpt_12  278217           5651        18554          31042       9705
#'
#' # Total hbgt
#' capacites_td %>% mutate(hbgt_total = rowSums(select(., starts_with("hbgt_"))))
#'
#' # A tibble: 13 x 7
#' dep        pop hbgt_collectif hbgt_locatif hbgt_plein_air hbgt_hotel hbgt_total
#' <glue>   <dbl>          <dbl>        <dbl>          <dbl>      <dbl>      <dbl>
#' 1 dpt_09  152611            187         2972           6337       1138      10634
#' 2 dpt_11  368323          11534        21106          35451       7662      75753
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"capacites_td"

#'  Tidy version of part of the \code{capacite} dataset limited to the weekly data \code{capa} per \code{dep} by week \code{sem_*}.
#'
#' @examples
#' capacites_sem_td
#'
#' # A tibble: 689 x 3
#' sem    dep      capa
#' <chr>  <glue>  <dbl>
#' 1 1 dpt_09 110910
#' 2 2 dpt_11 202467
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"capacites_sem_td"

# ---- Origines ----

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
