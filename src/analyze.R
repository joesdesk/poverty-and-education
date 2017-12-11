#! /usr/bin/env Rscript

# Perform analysis of tidy socioeconomic data.

# Usage: Rscript analyze.R <results/socioeconomic.csv> <results/scatter-relation.png>
# Arguments:
#   <results/socioeconomic.csv>     file location of the wrangled data
#   <results/scatter-relation.png>            file location of the generated figure

# Author: Jomar Sastrillo
# Date: December 10, 2017


# Extract arguments
args <- commandArgs(trailingOnly = TRUE)

socioeconomic_csv <- args[1]
relation_fig <- args[2]

# Load required libraries
library(tidyverse)


# Read in wrangled data
socioeconomic <- read.csv( socioeconomic_csv ) %>%
    filter_all( all_vars(!is.na(.)) )


# Export plot
plot <- ggplot(data=socioeconomic) +
    aes(x=higher_ed_proportion, y=poverty_proportion) +
    geom_point() +
    geom_smooth(method = "lm") +
    xlab("% of population with Bachelor's degree or higher") +
    ylab("% of people in poverty") +
    ggtitle("Relation between higher education level and poverty rate")

ggsave( relation_fig , plot = plot, device = "png")
