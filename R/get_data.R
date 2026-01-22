#' @title Retrieve and Load Datasets
#' 
#' @description
#' The `get_data` function is designed to load specific datasets from the 
#' `appliedepidata` package based on search criteria such as `name`, `language`, 
#' `group_identifier`, or `unique_identifier`. The function can either return
#' the dataset(s) or assign them into the global environment.
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
#' @param assign (optional) A logical value. If FALSE (default), the function 
#' returns the dataset(s). If TRUE, the dataset(s) are assigned to the global 
#' environment.
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
#'    - **Epinow objects** (`epinow` class) are directly assigned to the global 
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
#' If `assign = FALSE`, returns the dataset(s). If a single dataset is requested, 
#' returns that dataset. If multiple datasets are requested, returns a named list 
#' of datasets. If `assign = TRUE`, the dataset(s) are loaded into the global 
#' environment and the function returns NULL invisibly.
#' 
#' @examples
#' \dontrun{
#' # Load a dataset by name and return it
#' my_data <- get_data(name = "AJS_AmTiman")
#' 
#' # Load a dataset by name and assign to global environment
#' get_data(name = "AJS_AmTiman", assign = TRUE)
#' 
#' # Load a dataset by name and language, assign custom name
#' linelist <- get_data(name = "AJS_AmTiman", language = "en")
#' 
#' # Load datasets by group identifier and return as list
#' multiple_datasets <- get_data(group_identifier = "acutejaundicesyndrome_outbreak_tcd_2016")
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
                     unique_identifier = NULL,
                     assign = FALSE) {
  
  # Step 1: Lookup dataset information based on provided criteria
  dataset_info <- lookup_dataset(name = name, 
                                 language = language, 
                                 group_identifier = group_identifier, 
                                 usage = usage,
                                 unique_identifier = unique_identifier)
  
  # Initialize list to store returned objects if assign = FALSE
  if (!assign) {
    returned_objects <- list()
  }
  
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
          inherits(loaded_object, "stars") |
          inherits(loaded_object, "epinow") | 
          dataset_info$name[i] %in% c("incubation_period", "generation_time")) {
        
        # If it's a regular data frame or a specific object
        if (assign) {
          assign(dataset_info$name[i], loaded_object, envir = .GlobalEnv)
        } else {
          returned_objects[[dataset_info$name[i]]] <- loaded_object
        }
        
      } else if (inherits(loaded_object, "sf")) {
        
        # If it's an sf (spatial) object, ensure it's converted properly
        message("Loaded data is an sf object. Running sf::st_as_sf().")
        processed_data <- sf::st_as_sf(loaded_object)
        
        if (assign) {
          assign(dataset_info$name[i], processed_data, envir = .GlobalEnv)
        } else {
          returned_objects[[dataset_info$name[i]]] <- processed_data
        }
        
      } else if (is.list(loaded_object)) {
        
        # If it's a list (but not a data frame), split into individual objects
        message("Loaded data is a list. Splitting into individual objects.")
        
        if (assign) {
          list2env(loaded_object, envir = .GlobalEnv)
        } else {
          # When returning, keep the list items together
          returned_objects[[dataset_info$name[i]]] <- loaded_object
        }
        
      } else {
        
        # For any other type of object
        if (assign) {
          assign(dataset_info$name[i], loaded_object, envir = .GlobalEnv)
        } else {
          returned_objects[[dataset_info$name[i]]] <- loaded_object
        }
        
      }
      
    }, error = function(e) {
      stop(paste("Failed to load the dataset:", dataset_name, "\n", e$message))
    })
  }
  
  # Return the objects if assign = FALSE
  if (!assign) {
    # If only one dataset was requested, return it directly rather than as a list
    if (length(returned_objects) == 1) {
      return(returned_objects[[1]])
    } else {
      return(returned_objects)
    }
  } else {
    invisible(NULL)
  }
}
