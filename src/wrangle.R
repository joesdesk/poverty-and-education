#! /usr/bin/env Rscript

# Wrangle the downloaded data files.

# Usage: Rscript warngle.R <data/poverty.xls> <data/education.xls> <results/socioeconomic.xls>
# Arguments:
#   <data/poverty.xls>              file location of the poverty spreadsheet
#   <data/education.xls>            file location of the education spreadsheet
#   <results/socioeconomic.csv>     file location of the wrangled data csv


# Extract arguments
args <- commandArgs(trailingOnly = TRUE)

poverty_xls <- args[1]
education_xls <- args[2]
socioeconomic_csv <- args[3]

# Load required libraries
library(tidyverse)
library(readxl)

# Read data into data frames
education <- read_excel(education_xls, skip = 4, col_names = T)
poverty <- read_excel(poverty_xls, skip = 3, col_names = T)

# Extract important data

education <- education %>% 
    select(fips = "FIPS Code",
           state = "State",
           area_name = "Area name",
           higher_ed_proportion = "Percent of adults with a bachelor's degree or higher, 2011-2015")

poverty <- poverty %>% 
    select(fips = "FIPStxt",
              poverty_proportion = "PCTPOVALL_2015")


# We will join the data by the county identification code

socioeconomic <- full_join(education, poverty, by = "fips")


# Write the final dataset to file

write_csv(socioeconomic, socioeconomic_csv, na = "", append = FALSE)


