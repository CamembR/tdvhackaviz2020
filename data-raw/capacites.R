library(readr)
library(usethis)
library(stringr)
library(dplyr)

# Source https://github.com/ToulouseDataViz/Hackaviz2020
file_name <- "capacites.csv"
url <- str_glue("https://raw.githubusercontent.com/ToulouseDataViz/Hackaviz2020/master/{file_name}")
raw_data <- str_glue("data-raw/{file_name}")


if (!file.exists(raw_data)) {
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
    mutate(dpt = str_glue("dpt_{str_pad(num_dpt, 2, side = 'left', pad=0)}")) %>%
    select("dpt", "num_dpt", "nom_dpt", everything())

write_csv(capacites, raw_data)
usethis::use_data(capacites, overwrite = TRUE, compress = 'xz')
