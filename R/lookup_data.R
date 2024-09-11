#' Lookup Dataset Information
#'
#' This function is an internal function used within the `get_data.R` and 
#' `save_data.R` functions. 
#' This function helps retrieve information (from *tableoftables.xlsx*) about 
#' datasets based on provided search criteria such as `name`, `language`, 
#' `group_identifier`, or `unique_identifier`. It returns the dataset that 
#' matches the specified criteria or suggests alternatives if mismatches 
#' are found.

#'
#' @param name (optional) A string specifying the name of the dataset to search for.
#' @param language (optional) A string specifying the language of the dataset. 
#' If used with `name`, `group_identifier`, or `unique_identifier`, the function 
#' will filter datasets based on this language.
#' @param group_identifier (optional) A string identifying a group of related 
#' datasets. If provided, the function will return all datasets within the group 
#' unless further criteria are given.
#' @param unique_identifier (optional) A string representing the unique identifier 
#' for a dataset. 
#'
#' @details
#' The function performs searches in the following order:
#' 
#' 1. **Searching by `name`:** 
#'    - If a single dataset is found by `name`, the function checks if other 
#'    parameters like `language` or `group_identifier` match the dataset. 
#'    If they do not match, it suggests alternatives.
#'    - If multiple datasets are found, additional filtering is done based 
#'    on `language` or `group_identifier` (if specified).
#'
#' 2. **Handling incorrect `language` or `group_identifier`:** 
#'    - If a dataset is found by `name`, but the specified `language` or 
#'    `group_identifier` does not match, alternative datasets are suggested 
#'    based on the same `unique_identifier`.
#'
#' 3. **Searching by `group_identifier`:** 
#'    - If a `group_identifier` is provided, the function returns all datasets 
#'    within the group unless further refinement by `language` is necessary.
#'
#' 4. **Searching by `unique_identifier`:** 
#'    - If a `unique_identifier` is provided, the function will attempt to find 
#'    a dataset by that identifier and apply further filtering by `language` 
#'    or `name` if needed.
#'
#' @return A `data.frame` containing dataset information if a matching dataset 
#' is found. If no dataset is found or if multiple datasets are found and 
#' more details are required (unless for a group), an error message is 
#' returned with suggestions for further search refinement.
#'
#' @examples
#' \dontrun{
#' # Search by name
#' lookup_dataset(name = "AJS_AmTiman")
#'
#' # Search by name and language
#' lookup_dataset(name = "AJS_AmTiman", language = "en")
#'
#' # Search by group identifier and language
#' lookup_dataset(group_identifier = "acutejaundicesyndrome_outbreak_tcd_2016", language = "fr")
#'
#' # Search by unique identifier
#' lookup_dataset(unique_identifier = "acutejaundicesyndrome_outbreak_tcd_2016_linelist_1_1_outbreak_2016")
#'
#' # Search by name and group identifier
#' lookup_dataset(name = "AJS_AmTiman", group_identifier = "acutejaundicesyndrome_outbreak_tcd_2016")
#' }

lookup_dataset <- function(name = NULL, 
                           language = NULL, 
                           group_identifier = NULL, 
                           unique_identifier = NULL) {
  
  # Load the dataset lookup table
  table_of_tables <- rio::import(system.file("extdata", "tableoftables.xlsx", 
                                             package = "appliedepidata"))
  
  
  
  ###### NAME 
  # If `name` is specified (the most common interaction)
  if (!is.null(name)) {
    dataset_info <- table_of_tables %>%
      dplyr::filter(name == !!name)
    
    
    # if one name match - check other search criteria are correct, otherwise error
    # suggest alternative names matched by unique_id and criteria 
    if (nrow(dataset_info) == 1) {
      
      # check languages match 
      if(!is.null(language)) {
        
        wrong_language <- dataset_info[["language"]] != language
        
        if(wrong_language) {
          relevant_identifier <- table_of_tables %>%
            dplyr::filter(name == !!name) %>% 
            dplyr::pull(unique_identifier) 
          
          alternative_names <- table_of_tables %>% 
            dplyr::filter(language == !!language & 
                            unique_identifier %in% relevant_identifier) %>% 
            pull(name)
          
          if (length(alternative_names) > 0) {
            error_msg <- c(paste0("No datasets found with the specified criteria, did you mean any of these: ", 
                                  paste(alternative_names, collapse = "\n")))
          } else {
            error_msg <- "No datasets found matching search-criteria.
                            Double check your criteria using appliedepi::search_data()"
          }
          stop(error_msg)
        }
        
      }
      
      
      # check group identifiers match
      # check languages match 
      if(!is.null(group_identifier)) {
        
        wrong_group <- dataset_info[["group_identifier"]] != group_identifier
        
        if(wrong_group) {
          relevant_identifier <- table_of_tables %>%
            dplyr::filter(name == !!name) %>% 
            dplyr::pull(unique_identifier) 
          
          alternative_names <- table_of_tables %>% 
            dplyr::filter(group_identifier == !!group_identifier & 
                            unique_identifier %in% relevant_identifier) %>% 
            pull(name)
          
          if (length(alternative_names) > 0) {
            error_msg <- c(paste0("No datasets found with the specified criteria, did you mean any of these: ", 
                                  paste(alternative_names, collapse = "\n")))
          } else {
            error_msg <- "No datasets found matching search-criteria.
                            Double check your criteria using appliedepi::search_data()"
          }
          stop(error_msg)
        }
        
      }
      
        
    }
    
    
    # If multiple datasets are found, 
    # ask for more details (language or group_identifier)
    if (nrow(dataset_info) > 1) {
      if (!is.null(language)) {
        dataset_info <- dataset_info %>% filter(language == !!language)
   
        # If no datasets are found by name, 
        # suggest attempt to match based on unique identifier and language
        if (nrow(dataset_info) == 0) {
          relevant_identifier <- table_of_tables %>%
            dplyr::filter(name == !!name) %>% 
            dplyr::pull(unique_identifier) 
          
          alternative_names <- table_of_tables %>% 
            dplyr::filter(language == !!language & 
                            unique_identifier %in% relevant_identifier) %>% 
            pull(name)
          
          if (length(alternative_names) > 0) {
            error_msg <- c(paste0("No datasets found with the specified name and language, did you mean any of these: ", 
                                  paste(alternative_names, collapse = "\n")))
          } else {
              error_msg <- "No datasets found matching search-criteria.
                            Double check your criteria using appliedepi::search_data()"
            }
          stop(error_msg)
          }
        
      } else if (!is.null(group_identifier)) {
        dataset_info <- dataset_info %>% 
          filter(group_identifier == !!group_identifier)
      } else {
        stop("Multiple datasets found with this name. 
             Please specify 'language' or 'group_identifier'.
             You can find this using appliedepi::search_data().")
      }
      
      # After refining with language or group_identifier, check again
      if (nrow(dataset_info) > 1) {
        stop("Multiple datasets found with this name. 
             Please specify 'language' or 'group_identifier'.
             You can find this using appliedepi::search_data()")
      }
    }
    
    # If no datasets are found, raise an error
    if (nrow(dataset_info) == 0) {
      stop("No datasets found matching search-criteria. 
           Double check your criteria using appliedepi::search_data()")
    }
    
    return(dataset_info)
  }
  
  ###### LANGUAGE 
  # Check if only language is provided
  if (!is.null(language) & is.null(name) & is.null(group_identifier) & is.null(unique_identifier)) {
    stop("Please specify additional details, 
         such as 'name' or 'group_identifier', to identify the dataset.")
  }
  
  
  
  
  ###### GROUP IDENTIFIER
  # If `group_identifier` is provided, return all datasets from the group if no 
  # other details are specified
  if (!is.null(group_identifier)) {
    dataset_info <- table_of_tables %>%
      dplyr::filter(group_identifier == !!group_identifier)
    
    if (nrow(dataset_info) == 0) {
      stop("No datasets found for the specified 'group_identifier'.")
    }
    
    # if no language specified and there are some available - ask for more info
    if (nrow(dataset_info) > 1 & 
        is.null(language) & 
        length(unique(dataset_info$language)) > 1) {
      stop("Please specify a language, multiple found for this group")
    }
    
    # Check if both `group_identifier` and `language` are specified
    if (!is.null(language)) {
      dataset_info <- dataset_info %>%
        dplyr::filter(language == !!language)
    }
    
    # If multiple datasets are found, return them all 
    # (for potential batch processing)
    if (nrow(dataset_info) >= 1) {
      return(dataset_info)
    }
  }
  
  ###### UNIQUE IDENTIFIER 
  # Start by checking if `unique_identifier` is specified
  if (!is.null(unique_identifier)) {
    dataset_info <- table_of_tables %>%
      dplyr::filter(unique_identifier == !!unique_identifier)
    
    # Check if language is provided with unique_identifier
    if (nrow(dataset_info) > 1 & !is.null(language)) {
      dataset_info <- dataset_info %>% dplyr::filter(language == !!language)
    }
    
    # Check if name is provided with unique_identifier
    if (nrow(dataset_info) > 1 & !is.null(name)) {
      dataset_info <- dataset_info %>% dplyr::filter(name == !!name)
    }
    
    # If there are no matches, return error 
    if (nrow(dataset_info) == 0) {
      stop("No datasets found matching search-criteria.")
    }
    
    # If there are duplicate names for the same unique_identifier, 
    # ask for more details
    if (nrow(dataset_info) > 1) {
      stop("Multiple datasets found with the same unique identifier.
           Please specify 'language' or 'name'. 
           You can find this using appliedepi::search_data()")
    }
    
    # If one dataset is found, return it
    if (nrow(dataset_info) == 1) {
      return(dataset_info)
    }
  }

  ####### END
  
  # If no criteria are matched, return a general error message
  stop("No datasets found matching search-criteria. 
           Double check your criteria using appliedepi::search_data()")
}
