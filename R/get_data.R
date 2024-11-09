#' @title Retrieve and Load Datasets
#' 
#' @description
#' The `get_data` function is designed to load specific datasets from the 
#' `appliedepidata` package based on search criteria such as `name`, `language`, 
#' `group_identifier`, or `unique_identifier`. The function performs an internal 
#' lookup to identify the appropriate dataset(s), then loads and assigns them into 
#' the global environment.
#' 
#' Depending on the type of dataset (e.g., regular data frame, spatial data (`sf`), 
#' or list), appropriate post-processing is done to ensure proper handling and 
#' loading.
#' 
#' @param name (optional) A string specifying the name of the dataset to load.
#' @param language (optional) A string specifying the language of the dataset. 
#' If used with `name`, `group_identifier`, or `unique_identifier`, the function 
#' will filter datasets based on this language.
#' @param group_identifier (optional) A string identifying a group of related 
#' datasets. If provided, the function will return all datasets within the group 
#' unless further criteria are given.
#' @param usage (optional) A string representing where the datasets are used. 
#' If provided, the function will return all datasets within the group unless 
#' further criteria are given. 
#' @param unique_identifier (optional) A string representing the unique identifier 
#' for a dataset. 
#' 
#' @details
#' The function operates as follows:
#' 1. **Dataset Lookup:** It performs an internal lookup to identify datasets 
#'    matching the search criteria provided.
#' 
#' 2. **Loading Datasets:** For each dataset found:
#'    - It attempts to load the dataset using the `data()` function from 
#'      the `appliedepidata` package.
#'    - The dataset is loaded into a temporary environment to avoid global 
#'      environment clutter during the loading process.
#' 
#' 3. **Post-Processing Based on Object Type:** Once the dataset is loaded, 
#'    the function checks the type of object and handles it accordingly:
#'    - **Data frames** are directly assigned to the global environment without 
#'      any further processing.
#'    - **Phylo objects** (`phylo` class) are directly assigned to the global 
#'      environment without any further processing. 
#'    - **Stars objects** (`stars` class) are directly assigned to the global 
#'      environment without any further processing.  
#'    - **Spatial objects** (`sf` class) are processed using `sf::st_as_sf()` to 
#'      ensure correct handling of spatial data, and then assigned to the global 
#'      environment.
#'    - **Lists** that are not data frames are split into individual objects and 
#'      assigned to the global environment as separate entities.
#' 
#' If any dataset cannot be found or loaded, the function will raise an error.
#' 
#' @return
#' The dataset(s) are loaded into the global environment. Depending on the 
#' structure #' of the dataset, it could be a data frame, spatial object, or 
#' individual list elements loaded as separate objects.
#' 
#' @examples
#' \dontrun{
#' # Load a dataset by name
#' get_data(name = "AJS_AmTiman")
#' 
#' # Load a dataset by name and language
#' get_data(name = "AJS_AmTiman", language = "en")
#' 
#' # Load datasets by group identifier
#' get_data(group_identifier = "acutejaundicesyndrome_outbreak_tcd_2016")
#' 
#' }
#' 
#' @seealso
#' `appliedepidata::search_data()` for details on finding datasets and their criteria.
#' 
#' @export


get_data <- function(name = NULL, 
                     language = NULL, 
                     group_identifier = NULL, 
                     usage = NULL,
                     unique_identifier = NULL) {
  
  # Step 1: Lookup dataset information based on provided criteria
  dataset_info <- lookup_dataset(name = name, 
                                 language = language, 
                                 group_identifier = group_identifier, 
                                 usage = usage,
                                 unique_identifier = unique_identifier)
  
  # Step 2: Loop through each dataset found and load the corresponding .rda file
  for (i in 1:nrow(dataset_info)) {
    # Step 2.1: Load the internal dataset using data() function
    dataset_name <- dataset_info$name[i]
    
    tryCatch({
      # Load the dataset into a temporary environment to avoid clutter
      temp_env <- new.env()
      data(list = dataset_name, package = "appliedepidata", envir = temp_env)
      
      # Get the loaded object from the temporary environment
      loaded_object <- get(dataset_name, envir = temp_env)
      
      # Step 3: Post-process the loaded dataset
      if (is.data.frame(loaded_object) | 
          inherits(loaded_object, "phylo") |
          inherits(loaded_object, "stars")) {
        # If it's a regular data frame or a phylo object, assign it directly
        assign(dataset_info$name[i], loaded_object, envir = .GlobalEnv)
      } else if (inherits(loaded_object, "sf")) {
        # If it's an sf (spatial) object, ensure it's converted properly
        message("Loaded data is an sf object. Running sf::st_as_sf().")
        processed_data <- sf::st_as_sf(loaded_object)
        assign(dataset_info$name[i], processed_data, envir = .GlobalEnv)
      } else if (is.list(loaded_object)) {
        # If it's a list (but not a data frame), split it into individual objects
        message("Loaded data is a list. Splitting into individual objects.")
        list2env(loaded_object, envir = .GlobalEnv)
      } else {
        # For any other type of object, assign it directly
        assign(dataset_info$name[i], loaded_object, envir = .GlobalEnv)
      }
      
    }, error = function(e) {
      stop(paste("Failed to load the dataset:", dataset_name, "\n", e$message))
    })
  }
}
