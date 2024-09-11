# has each of the arguments from lookup_data
# path is either a url or the rstudiocli shit (to a folder)
# needs to have a lookup step that either uses list_data or 
  # combines file type from *tableoftables*
# paste filetype with inst>extdata 
# loop over each one to save 

save_data <- function(name = NULL, 
                      language = NULL, 
                      group_identifier = NULL, 
                      unique_identifier = NULL, 
                      path = rstudioapi::selectDirectory()){

  ## normalise in case given manually
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

