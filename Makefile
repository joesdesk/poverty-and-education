# Data to be downloaded

data/education.xls:
	bash src/get-data.sh https://www.ers.usda.gov/webdocs/DataFiles/48747/Education.xls?v=42762 data/education.xls

data/poverty.xls:
	bash src/get-data.sh https://www.ers.usda.gov/webdocs/DataFiles/48747/PovertyEstimates.xls?v=42762 data/poverty.xls

# Extract important parts of the data

results/socioeconomic.csv: data/education.xls data/poverty.xls
	Rscript src/wrangle.R data/poverty.xls data/education.xls results/socioeconomic.csv

# Generate the image and script

results/scatter-relation.png: results/socioeconomic.csv
	Rscript src/analyze.R results/socioeconomic.csv results/scatter-relation.png


	
	
# Cleans up the data
	
all: results/figure.png

clean:
	rm data/*
	rm results/*