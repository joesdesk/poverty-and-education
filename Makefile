# Makefile for poverty-and-education
# by Jomar Sastrillo (Dec 17, 2017)

# See README.md: Generating the report

# Data to be downloaded
data/education.xls:
	bash src/get-data.sh https://www.ers.usda.gov/webdocs/DataFiles/48747/Education.xls?v=42762 data/education.xls

data/poverty.xls:
	bash src/get-data.sh https://www.ers.usda.gov/webdocs/DataFiles/48747/PovertyEstimates.xls?v=42762 data/poverty.xls


# Extract important parts of the data
results/socioeconomic.csv: data/education.xls data/poverty.xls
	Rscript src/wrangle.R data/poverty.xls data/education.xls results/socioeconomic.csv


# Generate the image
results/scatter-relation.png: results/socioeconomic.csv
	Rscript src/analyze.R results/socioeconomic.csv results/scatter-relation.png


# Generate the report
doc/final.md: results/scatter-relation.png
	Rscript -e "ezknitr::ezknit('src/report.Rmd', out_dir='doc', keep_html = FALSE)"


# Alias for making the final report, which requires all dependent files
all: doc/final.md


# Cleans up the data, generated images and the report
clean:
	rm -f data/*.xls
	rm -f results/*
	rm -f doc/*


# Checks if user has required command line utilities and R packages
check:
	@echo "Checking for bash..."
	@bash --version
	@which bash
	@echo ""

	@echo "Checking for curl..."
	@curl --version
	@which curl
	@echo ""

	@echo "Checking for Rscript..."
	@Rscript --version
	@which Rscript
	@echo ""

	@echo "Checking R libraries:"

	@echo "tidyverse installed?"
	@Rscript -e "'tidyverse' %in% installed.packages()"
	@echo ""

	@echo "readxl installed?"
	@Rscript -e "'readxl' %in% installed.packages()"
	@echo ""

	@echo "ezknitr installed?"
	@Rscript -e "'ezknitr' %in% installed.packages()"
	@echo ""
