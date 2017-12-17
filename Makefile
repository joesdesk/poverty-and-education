# Data to be downloaded

directory:
	#mkdir data results doc

data/education.xls: directory
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
	Rscript -e 'ezknitr::ezknit("src/report.Rmd", out_dir="doc", keep_html = FALSE)'


# Alias for making the final report, which requires all dependent files

all: doc/final.md


# Cleans up the data

clean:
	rm -f data/*
	rm -f results/*
	rm -f doc/*
