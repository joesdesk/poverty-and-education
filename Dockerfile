# Docker file for poverty-and-education
# Copied Verbatim from Tiffany Timbers, Dec, 2017
# (see https://github.com/ttimbers/data_analysis_pipeline_eg)

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# then install the ezknitr packages
RUN Rscript -e "install.packages('ezknitr', repos = 'https://mran.revolutionanalytics.com/snapshot/2017-12-11')"
RUN Rscript -e "install.packages('readxl', repos = 'http://cran.us.r-project.org')"

# install python 3
#RUN apt-get update \
#  && apt-get install -y python3-pip python3-dev \
#  && cd /usr/local/bin \
#  && ln -s /usr/bin/python3 python \
#  && pip3 install --upgrade pip

# get python package dependencies
#RUN apt-get install -y python3-tk

# install numpy & matplotlib
#RUN pip3 install numpy
#RUN apt-get update && \
#    pip3 install matplotlib && \
#    rm -rf /var/lib/apt/lists/*
