## code to prepare `gis_population_sle_population_statistics_sierraleone_2020` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "gis_population_sle_population_statistics_sierraleone_2020.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
gis_population_sle_population_statistics_sierraleone_2020 <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## age/sex population proportions for Sierra Leone, same source as
## sle_admpop_adm3_2020 (Humanitarian Data Exchange), for the GIS basics
## population pyramid example

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(gis_population_sle_population_statistics_sierraleone_2020, overwrite = TRUE)
