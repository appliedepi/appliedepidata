## code to prepare `multidisease_notifications` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "multidisease_notifications.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
multidisease_notifications <- rio::import(file_path)

# Interalise the data
usethis::use_data(multidisease_notifications, overwrite = TRUE)


## Translate dataset

# load packages 
pacman::p_load(
  googledrive,           # get dictionaries
  rio,                   # get dictionaries
  matchmaker,            # recode from dictionaries
  dplyr                  # for filtering (should just use base but lazy)
)

# define languages 
langs <- c("FR", "ES", "PT")

# load data 
data_raw <- multidisease_notifications

# load translation dictionaries 
# (is an excel sheet on drive not a google sheet - 
# so both googlesheets4 and rio are not playing ball)

temp_file <- tempfile(fileext = ".xlsx")
drive_download(as_id("1k-XnMK47WOLDqgltMFyvyzY4wNz-MOyf"), 
               path = temp_file)

# Read specific sheets
dict_dataset_names <- rio::import(temp_file, which = "dataset_names")
dict_vars <- rio::import(temp_file, which = "notif_variables")
dict_vals <- rio::import(temp_file, which = "notif_values")

# tranlsate 

dats <- list()

for (i in langs) {
  # overwrite a generic dataset for both notif and labs 
  generic_data <-  data_raw


  # translate vals first 
  # otherwise var names not in dict
  generic_data <-  matchmaker::match_df(
      x = generic_data, 
      dictionary = dict_vals |> 
        filter(type != "clean"), 
      from = "label", 
      to = i, 
      by = "variable_name"
    )


  # translate vars 
  names(generic_data) <- matchmaker::match_vec(
      names(generic_data), 
      dictionary = dict_vars |> 
        filter(type != "clean"), 
      from = "variable_name", 
      to = i)

  # select appropriate filename
  appropriate_filename <- dict_dataset_names[
    dict_dataset_names$dataset_name == "multidisease_notifications", i]

  # chuck in list 
  # (so can check in R if need)
  dats[[appropriate_filename]] <- generic_data 
  
  # export as per case study requirements 
  rio::export(generic_data, paste0("inst/extdata/", appropriate_filename, ".xlsx"))

}