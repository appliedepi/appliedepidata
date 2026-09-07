## code to prepare `sle_adm3` dataset goes here
# This creates an .rda format of the sle_adm3.shp file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "sle_adm3.zip", package = "appliedepidata")

# Read in the Excel file using rio
sle_adm3 <- sf::read_sf(paste0("/vsizip/", file_path))

# process data as needed (e.g. cleaning, recoding, restructuring)

# The shapefile's validTo field is empty for every row. Depending on the
# GDAL version used to read it, that empty date is parsed either as NA or
# as a pre-1900 sentinel date (e.g. -0001-11-30). Normalize any such
# implausible date to NA so the resulting dataset doesn't depend on which
# GDAL version built it.
sle_adm3$validTo[!is.na(sle_adm3$validTo) & sle_adm3$validTo < as.Date("1900-01-01")] <- NA

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(sle_adm3, overwrite = TRUE)
