library(readr)
library(usethis)
library(stringr)

# Source https://github.com/ToulouseDataViz/Hackaviz2020
file_name <- "nuitees.csv"
url <- str_glue("https://raw.githubusercontent.com/ToulouseDataViz/Hackaviz2020/master/{file_name}")
raw_data <- str_glue("data-raw/{file_name}")


if (!file.exists(raw_data)) {
    download.file(url, raw_data)
}

raw <- readr::read_csv(raw_data,
                       col_names = TRUE,
                       na = "(NA)"
)

# No transformation needed
nuitees <- raw

write_csv(nuitees, raw_data)
usethis::use_data(nuitees, overwrite = TRUE, compress = 'xz')
