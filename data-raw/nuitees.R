library(tidyverse)


# Source https://github.com/ToulouseDataViz/Hackaviz2020
file_name <- "nuitees.csv"
url <- str_glue("https://raw.githubusercontent.com/ToulouseDataViz/Hackaviz2020/master/{file_name}")
raw_data <- str_glue("data-raw/{file_name}")
# Reload or not the file from the source
reload <- TRUE

if (reload | !file.exists(raw_data)) {
    download.file(url, raw_data)
}

raw <- readr::read_csv(raw_data,
                       col_names = TRUE,
                       na = "(NA)"
)

nuitees <- raw
# Tidy version
nuitees_td <- nuitees %>%
    # Removing total
    select(-total_occitanie) %>%
    gather(dep,nuitees,dpt_09:dpt_82) %>%
    arrange(date, dep)


write_csv(nuitees, raw_data)
usethis::use_data(nuitees, overwrite = TRUE, compress = 'xz')
usethis::use_data(nuitees_td, overwrite = TRUE, compress = 'xz')
usethis::use_data(nuitees_td, overwrite = TRUE, compress = 'xz')
