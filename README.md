# poverty-and-education

It is often said that education offers a path out of poverty and allows one to climb up the economic ladder. In this rudimentary analysis, we examine if education rates and poverty rates are linked.

The study examines data that the US government [1] has made available. The economic research service branch of the US Department of agriculture has conveniently made available economic and education data at the county level.

The hypothesis is that education and poverty are negatively correlated. The pairwise relationship between the education rates and poverty rates can be quantified by the correlation and their dependence or lack of can be shown on a scatter plot.

This report shows that the simple assumption of a linear relationship is insufficient to describe the observations. However, a trend is that poverty rates are lower for counties whose populations have attained college degrees at higher rates, thus reinforcing the belief that education is a path out of poverty.



# Dependencies

## Make
This project requires several programs and packages to be installed. Dependencies can be easily checked by opening a command line and changing directory such that the command
```
pwd
```
gives
```
the/path/to/poverty-and-education
```

The project requires `make` to build which can be checked by typing
```
make --version
```
If a version number is returned, the remaining dependencies can be checked with
```
make check
```
which lists the dependencies and whether they are accessible.

## Packrat
The project can also be built from within Rstudio by opening the `poverty-and-education.Rproj` file at the project root directory. `packrat` should install the missing R packages if they are missing. If `packrat` is missing, it can install itself. One can navigate to the Rstudio console and run the `make` commands from there (see "Dependencies: Make" and "Generating the report").

## Docker
A docker image container that contains the required packages and utilities can be pulled by the name `sastrill/poverty-and-education` with a Docker program. For security reasons, the project itself is not on the docker image. Thus, it must be "linked" from a folder on your computer to the "ephemeral" container. The code below performs the link and the build process. No `make check` is necessary since the Docker image was designed with all the necessary dependencies.

```
docker run -it --rm -v "/c/path/to/poverty-and-education":/home/poverty-and-education sastrill/poverty-and-education make all -C /home/poverty-and-education
```

_Note:_ Users should take note to surround first path with quotes (double quotes specifically) if the path contains a space. The root directory for Windows users in git bash form is `/c/` instead of `C:\`.

Once built, the final report resides in [doc/report.md](doc/report.md).


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
