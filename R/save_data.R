#' @title Save Data Files to a Specified Directory
#' 
#' @description 
#' The `save_data` function saves dataset files (and unzips them if necessary) 
#' based on search criteria such as dataset `name`, `language`, `group_identifier`,
#'  or `unique_identifier`. It checks for the existence of the required files, 
#'  and if all files exist, they are either copied or unzipped into the specified 
#'  directory.
#'
#' @param name (optional) A string specifying the name of the dataset to save.
#' @param language (optional) A string specifying the language of the dataset. 
#' If used with `name`, `group_identifier`, or `unique_identifier`, the function
#' will filter datasets based on this language.
#' @param group_identifier (optional) A string identifying a group of related 
#' datasets. If provided, the function will return all datasets within the group 
#' unless further criteria are given.
#' @param unique_identifier (optional) A string representing the unique identifier 
#' for a dataset. 
#' @param path (optional) A string specifying the directory where the dataset 
#' files will be saved. If not provided, the function will prompt the user to 
#' select a directory via the `rstudioapi::selectDirectory()` function.
#'
#' @details
#' The function assumes that the dataset files are available in the "extdata" 
#' directory of the `appliedepidata` package.
#' The function follows these steps:
#' 
#' 1. **Dataset Lookup**: It looks up dataset information using `lookup_dataset` 
#' based on the provided search criteria (`name`, `language`, `group_identifier`, 
#' or `unique_identifier`).
#' 2. **File Existence Check**: It checks if all required dataset files exist 
#' using the `list_data` function. If any files are missing, an error message 
#' lists them.
#' 3. **File Copying and Unzipping**: If all files are found, the function 
#' copies the files to the specified directory. If the files are zipped (`.zip`), 
#' they are unzipped before being saved.
#'
#' @return 
#' No return value. The function saves the specified dataset files to the chosen 
#' directory. A success or failure message is printed upon completion.
#' 
#' @importFrom cli cli_alert_success
#' 
#' @examples
#' \dontrun{
#' # Save a dataset by name to a chosen directory
#' save_data(name = "AJS_AmTiman", path = "/path/to/save/directory")
#' 
#' # Save a dataset by group identifier and language
#' save_data(group_identifier = "acutejaundicesyndrome_outbreak_tcd_2016", language = "fr")
#' 
#' # Save a dataset by unique identifier
#' save_data(unique_identifier = "acutejaundicesyndrome_outbreak_tcd_2016_linelist_1_1_outbreak_2016")
#' }
#'
#' @export

save_data <- function(name = NULL, 
                      language = NULL, 
                      group_identifier = NULL, 
                      unique_identifier = NULL, 
                      path = rstudioapi::selectDirectory()){

  # normalise in case given manually
  path <- normalizePath(path)
  
  # Step 1: Lookup dataset information based on provided criteria
  dataset_info <- lookup_dataset(name = name, 
                                 language = language, 
                                 group_identifier = group_identifier, 
                                 unique_identifier = unique_identifier)
  
  files_to_copy <- paste0(dataset_info$name, ".", dataset_info$extension)
  
  # Step 2: check that all the files exist 
  existing_files <- list_data()
  check_files <- files_to_copy %in% paste0(existing_files$name, ".", existing_files$extension)
  
  if (any(!check_files)) {
    # get the missing files 
    missing_files <- files_to_copy[!check_files]
    # Code to handle the case when some files do not exist
    stop(paste0("The following files are missing: ", paste(missing_files, collapse = ", ")))
  } else {
    # step 3: save the files 
    files_to_copy <- system.file("extdata", files_to_copy, 
                                 package = "appliedepidata")
    
    success <- lapply(files_to_copy, file.copy, to = path, overwrite = TRUE)
    
    if(all(as.logical(success))) cli::cli_alert_success("File(s) successfully saved here: {path}")
  
  }
}

