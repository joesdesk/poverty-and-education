# Docker file for poverty-and-education
# Adapted almost verbatim from Tiffany Timbers, Dec, 2017
# (see https://github.com/ttimbers/data_analysis_pipeline_eg)

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# need to install utility to download dataset
RUN apt-get install -y curl

# then install the ezknitr packages
RUN Rscript -e "install.packages('ezknitr', repos = 'https://mran.revolutionanalytics.com/snapshot/2017-12-11')"
RUN Rscript -e "install.packages('readxl', repos = 'http://cran.us.r-project.org')"