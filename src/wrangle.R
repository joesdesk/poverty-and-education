#! /usr/bin/env Rscript

# Wrangle the downloaded data files.

# Usage: Rscript warngle.R <data/poverty.xls> <data/education.xls> <results/socioeconomic.xls>
# Arguments:
#   <data/poverty.xls>              file location of the poverty spreadsheet
#   <data/poverty.xls>              file location of the education spreadsheet
#   <results/socioeconomic.csv>     file location of the wrangled data csv


# Extract arguments
args <- commandArgs(trailingOnly = TRUE)

poverty_xls <- args[1]
education_xls <- args[2]
socioeconomic_csv <- args[3]

# Load required libraries
library(readxl)

#
education <- read_excel("data/education.xls")
poverty <- read_excel("data/poverty.xls")

output_fileref <- file(socioeconomic_csv)
writeLines("a", output_fileref)
close(output_fileref)

