#' @title Fictional Ebola Virus Disease data simulating properties from the West African Ebola outbreak of 2014
#'
#' @description
#' Fictional Ebola Virus Disease data simulating properties from the West African 
#' Ebola outbreak of 2014
#'  
#' @details
#' This is fictional case-linelist which contains de-indentified individual level data 
#' on clinical outcome, demographics and region.
#'  
#' @source This data was originally added to the {outbreaks} package, extensive 
#' edits have been made for teaching purposes. 
#' The data was originally simulated to match properties of the 
#' West African Ebola outbreak of 2014-2015 (see {outbreaks} package documentation 
#' for details). 
#' 
#' The original dataset can be accessed using outbreaks::ebola_sim 
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT) 
#' 
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}' 
#' @format A data frame with 136 rows and 8 columns
#' 
#' @docType data
"linelist_raw"



#' @title Cleaned fictional Ebola Virus Disease data simulating properties from the 
#' West African Ebola outbreak of 2014
#'
#' @description
#' Excel and associated R dataset with cleaned version of fictional Ebola Virus Disease data simulating 
#' properties from the West African Ebola outbreak of 2014
#'  
#' @details
#' This is fictional case-linelist which contains de-indentified individual level data 
#' on clinical outcome, demographics and region.
#'  
#' @source This data is a cleaned version of \link{linelist_raw}, which is cleaned
#' using code in the [epiRhandbook cleaning chapter](https://epirhandbook.com/en/new_pages/cleaning.html).
#' 
#' The original dataset can be accessed using `get_data("linelist_raw")`
#' 
#' This is version 2.0 (excel) and version 3.0 (Rds).  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT) 
#' 
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}' 
#' @format A data frame with 5888 rows and 30 columns
#' 
#' @docType data
"linelist_cleaned"