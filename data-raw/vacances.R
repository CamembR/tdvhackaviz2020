library(tidyverse)
library(lubridate)


# Source https://github.com/AntoineAugusti/vacances-scolaires
file_name <- "data.csv"
url <- str_glue("https://raw.githubusercontent.com/cAntoineAugusti/vacances-scolaires/master/{file_name}")
raw_data <- str_glue("data-raw/{file_name}")
# Reload or not the file from the source
reload <- FALSE

if (reload | !file.exists(raw_data)) {
    download.file(url, raw_data)
}

raw <- readr::read_csv(raw_data,
                       col_names = TRUE,
                       na = "",
                       locale = locale("fr", encoding = "ISO-8859-1")
)

vacances <- raw

# Tidy version
vacances_td <- vacances %>%
    select(-nom_vacances) %>%
    filter(date > ymd("2017-12-31"), date < ymd("2019-01-1") ) %>% # Selecting only 2018 to be consistent with other
    gather(zone,vacances,vacances_zone_a:vacances_zone_c) %>%
    mutate(zone = factor(toupper(str_replace(zone, "vacances_zone_", "")))) %>%
    arrange(date, zone)

write_csv(vacances, raw_data)
usethis::use_data(vacances, overwrite = TRUE, compress = 'xz')
usethis::use_data(vacances_td, overwrite = TRUE, compress = 'xz')
