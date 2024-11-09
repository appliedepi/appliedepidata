## code to prepare `germany_weather` dataset goes here
# This creates an .rda format of the germany_weather[year].nc file

# Define the path to the zip file
file_path <- system.file("extdata", "germany_weather.zip", package = "appliedepidata")

# Create a temporary directory
temp_dir <- tempdir()

# Unzip .nc files to the temporary directory
unzip(file_path, exdir = temp_dir)

# List all .nc files in the temporary directory
nc_files <- list.files(temp_dir, pattern = "\\.nc$", full.names = TRUE)

# Read each .nc file with stars and store in a list
germany_weather <- stars::read_stars(nc_files)


# process data as needed (e.g. cleaning, recoding, restructuring)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(germany_weather, overwrite = TRUE)