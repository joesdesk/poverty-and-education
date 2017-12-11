# poverty-and-education

It is often said that education offers a path out of poverty and allows one to climb up the economic ladder. In this rudimentary analysis, we examine if education rates and poverty rates are linked.

The study examines data that the US government [1] has made available. The economic research service branch of the US Department of agriculture has conveniently made available economic and education data at the county level.

The hypothesis is that education and poverty are negatively correlated. The pairwise relationship between the education rates and poverty rates can be quantified by the correlation and their dependence or lack of can be shown on a scatter plot.


# Dependencies
This project requires several programs and packages to be installed. Open a command line and change the directory to the repository root. Run the scripts to check if you have the required packages.

1. `curl` is a utility to download files from the web. Run `$ curl --version` to see if it exists.
2. `Rscript` runs instructions for analysis in a `.Rscript` file. Run `$ Rscript --version` to see if it exists.
3. Several `R` packages are required to perform the analysis. We can check them individually by running
```
Rscript -e '\"tidyverse\" %in% installed.packages()'
Rscript -e '\"readxl\" %in% installed.packages()'
Rscript -e '\"ezknitr\" %in% installed.packages()'
```
which should all return `TRUE`. The `\"` is an escape sequence for `""` that is necessary for Windows users running using git bash. Other users may have to remove the escaping `\`.


# Generating the report

The data is in the form of two excel files:
  * https://www.ers.usda.gov/data-products/county-level-data-sets/poverty/
  * https://www.ers.usda.gov/data-products/county-level-data-sets/education/

which are downloaded using the script `src/get-data.sh`. To download the files to the correct directory, run
```bash
bash src/get-data.sh https://www.ers.usda.gov/webdocs/DataFiles/48747/Education.xls?v=42762 data/education.xls
bash src/get-data.sh https://www.ers.usda.gov/webdocs/DataFiles/48747/PovertyEstimates.xls?v=42762 data/poverty.xls
```

Specific data from these two files will be wrangled together using an Rscript. The cleaned data set is saved in `results/socioeconomic.csv` by running
```bash
Rscript src/wrangle.R data/poverty.xls data/education.xls results/socioeconomic.csv
```

A scatterplot is generated from this data using another Rscript by calling
```bash
Rscript src/analyze.R results/socioeconomic.csv results/scatter-relation.png
```
which generates the figure `results/scatter-relation.png`.

Finally, the report uses this figure. To generate the report,
```bash
Rscript -e 'ezknitr::ezknit(\"src/report.Rmd\", out_dir=\"doc\", keep_html = FALSE)'
```

The final report will be available in `doc/report.md`.


# Sources
* [1] County-level Data Sets . United States Department of Agriculture: Economic Research Service. Accessed 2017. URL: https://www.ers.usda.gov/data-products/county-level-data-sets/
