library(tidyverse)
library(readxl)
library(usethis)
library(lubridate)


# Source https://github.com/ToulouseDataViz/Hackaviz2020
file_name <- "complements.xlsx"
url <- str_glue("https://raw.githubusercontent.com/ToulouseDataViz/Hackaviz2020/master/{file_name}")
raw_data <- str_glue("data-raw/{file_name}")


if (!file.exists(raw_data)) {
    download.file(url, raw_data)
}

# ---- Evenements ----

# Departements are transformed to match column name in other datasets

raw <- readxl::read_excel(raw_data,
                          sheet = "Evénements")

comp_evenements <- raw %>%
    rename(num = "N°", dpt = "Département", evt = "Evénement", deb = "Début", fin = "Fin") %>%
    mutate(deb = as_date(deb), fin = as_date(fin), dpt = str_glue("dpt_{str_pad(dpt, 2, side = 'left', pad=0)}"))

write_csv(comp_evenements, "data-raw/comp_evenements.csv")
usethis::use_data(comp_evenements, overwrite = TRUE, compress = 'xz')

# ---- Departements ----

raw <- readxl::read_excel(raw_data,
                          sheet = "Départements")

comp_departements <- raw %>%
    rename(num_dpt = "N° département", nom_dpt = "Nom du département") %>%
    mutate(dpt =  str_glue("dpt_{str_pad(num_dpt, 2, side = 'left', pad=0)}")) %>%
    select(dpt, num_dpt, nom_dpt)

write_csv(comp_departements, "data-raw/comp_departements.csv")
usethis::use_data(comp_departements, overwrite = TRUE, compress = 'xz')


# ---- Pays ----

raw <- readxl::read_excel(raw_data,
                          sheet = "Pays")
comp_pays <- raw %>%
    rename(code = "Pays", nom_pays = "Nom Pays")

write_csv(comp_pays, "data-raw/comp_pays.csv")
usethis::use_data(comp_pays, overwrite = TRUE, compress = 'xz')
