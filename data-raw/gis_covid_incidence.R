## code to prepare `gis_covid_incidence` dataset goes here

# Define the path to the csv file in inst/extdata
file_path <- system.file("extdata", "gis_covid_incidence.csv", package = "appliedepidata")

# Read in the csv file using rio
gis_covid_incidence <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## fictional cumulative COVID-19 incidence by country, created for the
## GIS basics choropleth mapping example

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(gis_covid_incidence, overwrite = TRUE)
