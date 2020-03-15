library(readr)
library(usethis)
library(stringr)
library(dplyr)

# Source https://github.com/ToulouseDataViz/Hackaviz2020
file_name <- "capacites.csv"
url <- str_glue("https://raw.githubusercontent.com/ToulouseDataViz/Hackaviz2020/master/{file_name}")
raw_data <- str_glue("data-raw/{file_name}")
# Reload or not the file from the source
reload <- TRUE

if (reload | !file.exists(raw_data)) {
    download.file(url, raw_data)
}

raw <- readr::read_csv(raw_data,
                       col_names = TRUE,
                       na = "(NA)",
                       locale = locale("fr", encoding = "ISO-8859-1")
)

capacites <- raw %>%
    rename_all(tolower) %>%
    rename(num_dpt = dpt) %>%
    mutate(dep = str_glue("dpt_{str_pad(num_dpt, 2, side = 'left', pad=0)}")) %>%
    select(-num_dpt, -nom_dpt) %>%
    select(dep, everything()) %>%
    arrange(dep)

capacites_td <- capacites %>%
    select(-starts_with("sem_"), -hbgt_total) %>%
    mutate(dep = factor(str_replace(dep, "dpt_", ""))) %>%
    rename(pop = pop_dpt) %>%
    arrange(dep)

capacites_sem_td <- capacites %>%
    select(dep, starts_with("sem_")) %>%
    mutate(dep = factor(str_replace(dep, "dpt_", ""))) %>%
    gather(sem,capa,sem_01:sem_53) %>%
    mutate(sem = as.numeric(str_replace(sem, "sem_", ""))) %>%
    select(sem, dep, capa) %>%
    arrange(sem, dep)


write_csv(capacites, raw_data)
usethis::use_data(capacites, overwrite = TRUE, compress = 'xz')
usethis::use_data(capacites_td, overwrite = TRUE, compress = 'xz')
usethis::use_data(capacites_sem_td, overwrite = TRUE, compress = 'xz')
