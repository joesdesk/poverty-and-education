# Data to be downloaded

data/education.xls:
	bash src/get-data.sh https://www.ers.usda.gov/webdocs/DataFiles/48747/Education.xls?v=42762 data/education.xls

data/poverty.xls:
	bash src/get-data.sh https://www.ers.usda.gov/webdocs/DataFiles/48747/PovertyEstimates.xls?v=42762 data/poverty.xls

all: data/education.xls data/poverty.xls

clean:
	rm data/*