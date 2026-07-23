## code to prepare `gis_linelist_cleaned_with_adm3` dataset goes here

# Define the path to the rds file in inst/extdata
file_path <- system.file("extdata", "gis_linelist_cleaned_with_adm3.rds", package = "appliedepidata")

# Read in the rds file using rio
gis_linelist_cleaned_with_adm3 <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the same content as linelist_cleaned_with_adm3, repackaged for the
## GIS basics mapping example

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(gis_linelist_cleaned_with_adm3, overwrite = TRUE)
