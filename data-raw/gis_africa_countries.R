## code to prepare `gis_africa_countries` dataset goes here
# This creates an .rda format of the gis_africa_countries.json file

# Define the path to the geojson file in inst/extdata
file_path <- system.file("extdata", "gis_africa_countries.json", package = "appliedepidata")

# Read in the geojson file using sf
gis_africa_countries <- sf::read_sf(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## Natural Earth Admin-0 country boundaries, filtered to the African continent,
## for the GIS basics mapping example

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(gis_africa_countries, overwrite = TRUE)
