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
#' # To get total_occitanie
#' nuitees_td %>%
#'   group_by(date) %>%
#'   summarise(total_occitanie = sum(nuitees))
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
#' # Total hbgt
#' capacites_td %>% mutate(hbgt_total = rowSums(select(., starts_with("hbgt_"))))
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"capacites_td"

#'  Tidy version of part of the \code{capacite} dataset limited to the weekly data \code{capa} per \code{dep} by week \code{sem_*}.
#'
#' @examples
#' capacites_sem_td
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"capacites_sem_td"

# ---- Origines ----

#' Tidy version of the \code{par_origines} dataset.
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"par_origines"

#' Tidy version of the \code{par_origines} dataset.
#'
"par_origines_td"

#' Complements / Evenements
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"comp_evenements"

#' Complements / Departements
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"comp_departements"

#' Complements / pays
#'
#' @source \url{https://github.com/ToulouseDataViz/Hackaviz2020}
"comp_pays"

# ---- Vacances ----

#' Vacances dataset
#'
#' @source \url{https://github.com/AntoineAugusti/vacances-scolaires}
"vacances"

#' Tidy version of the \code{vacances} dataset.
#'
#' @source \url{https://github.com/AntoineAugusti/vacances-scolaires}
"vacances_td"
