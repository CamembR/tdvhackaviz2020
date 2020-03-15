library(readr)
library(usethis)
library(stringr)

# Source https://github.com/ToulouseDataViz/Hackaviz2020
file_name <- "par_origines.csv"
url <- str_glue("https://raw.githubusercontent.com/ToulouseDataViz/Hackaviz2020/master/{file_name}")
raw_data <- str_glue("data-raw/{file_name}")
# Reload or not the file from the source
reload <- FALSE

if (reload | !file.exists(raw_data)) {
    download.file(url, raw_data)
}

raw <- readr::read_csv(raw_data,
                       col_names = TRUE,
                       na = "(NA)"
)

par_origines <- raw %>%
    rename_all(tolower)

par_origines_td <- par_origines %>%
    rename(dep_org = org, dep_dest = dest) %>%
    mutate(dep_org = factor(dep_org), dep_dest = factor(dep_dest)) %>%
    arrange(date, dep_org, dep_dest)


write_csv(par_origines, raw_data)
usethis::use_data(par_origines, overwrite = TRUE, compress = 'xz')
usethis::use_data(par_origines_td, overwrite = TRUE, compress = 'xz')
