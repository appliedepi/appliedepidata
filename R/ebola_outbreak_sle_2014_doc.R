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
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100} 
#' @format A data frame with 136 rows and 8 columns
#' 
#' @docType data
"linelist_raw"



#' @title Cleaned fictional Ebola Virus Disease data simulating properties from the 
#' West African Ebola outbreak of 2014
#'
#' @description
#' Excel file with cleaned version of fictional Ebola Virus Disease data simulating 
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
#' This is version 2.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT) 
#' 
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100} 
#' @format A data frame with 5888 rows and 30 columns
#' 
#' @docType data
"linelist_cleaned_excel"



#' @title Cleaned fictional Ebola Virus Disease data simulating properties from the 
#' West African Ebola outbreak of 2014
#'
#' @description
#' R-dataset file with cleaned version of fictional Ebola Virus Disease data simulating 
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
#' This is version 3.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT) 
#' 
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100} 
#' @format A data frame with 5888 rows and 30 columns
#' 
#' @docType data
"linelist_cleaned_rds"


#' @title Subset of cleaned fictional Ebola Virus Disease data simulating properties from the 
#' West African Ebola outbreak of 2014
#'
#' @description
#' Subset of cleaned version of fictional Ebola Virus Disease data simulating 
#' properties from the West African Ebola outbreak of 2014
#'  
#' @details
#' This is fictional case-linelist which contains de-indentified individual level data 
#' on clinical outcome, demographics and region.
#'  
#' @source This data is a subset version of \link{linelist_cleaned_excel}, which is cleaned
#' using code in the [epiRhandbook cleaning chapter](https://epirhandbook.com/en/new_pages/cleaning.html).
#' 
#' The original dataset can be accessed using `get_data("linelist_cleaned_excel")`
#' 
#' This is version 4.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT) 
#' 
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100} 
#' @format A data frame with 454 rows and 30 columns
#' 
#' @docType data
"hospital_linelists"



#' @title Subset with additional spatial data of cleaned fictional Ebola Virus Disease data simulating properties from the 
#' West African Ebola outbreak of 2014
#'
#' @description
#' Subset with additional spatial data of rds clean version of fictional Ebola Virus 
#' Disease data simulating properties from the West African Ebola outbreak of 2014
#'  
#' @details
#' This is fictional case-linelist which contains de-indentified individual level data 
#' on clinical outcome, demographics and region.
#'  
#' @source This data is a cleaned version of \link{linelist_cleaned_rds}, which is cleaned
#' using code in the [epiRhandbook cleaning chapter](https://epirhandbook.com/en/new_pages/cleaning.html).
#' 
#' The original dataset can be accessed using `get_data("linelist_cleaned_rds")`
#' 
#' This is version 4.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT) 
#' 
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}
#' @format A data frame with 454 rows and 30 columns
#' 
#' @docType data
"linelist_cleaned_with_adm3"


#' @title Example data dictionary for fictional Ebola Virus Disease data simulating properties from the 
#' West African Ebola outbreak of 2014
#'
#' @description
#' Incomplete data dictionary used for demonstrating cleaning of raw version of fictional Ebola Virus 
#' Disease data simulating properties from the West African Ebola outbreak of 2014
#'  
#' @details
#' This is fictional data dictionary which contains recoding information. 
#'  
#' @source This has been created as an example for use with  \link{linelist_raw}, 
#' which is cleaned using code in the [epiRhandbook cleaning chapter](https://epirhandbook.com/en/new_pages/cleaning.html).
#' 
#' The original dataset can be accessed using `get_data("linelist_raw")`
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT) 
#' 
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100} 
#' @format A data frame with 9 rows and 3 columns
#' 
#' @docType data
"cleaning_dict"



#' @title Shapefile at admin 3 level for Sierra Leone from Humanitarian Data Exchange
#'
#' @description
#' Shapefile at admin 3 level for Sierra Leone from Humanitarian Data Exchange
#' 
#' @details
#' This shapefile can be used together with \link{linelist_cleaned_with_adm3}.
#' Data collected from the government of Sierra Leone and cleaned and pcoded by UNOCHA and ITOS 
#' Admin4 : Data provided by OCHA, attribute fields and geometries have been 
#' checked by UNMEER IM (Ghana) Will be replaced if/when official Government data is provided
#'  
#' @source This shapefile was downloaded from [Humanitarian Data Exchange](https://data.humdata.org/dataset/cod-ab-sle)
#' 
#' This is the original dataset and was not edited (other than renaming)
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-IGO](https://data.humdata.org/faqs/licenses) 
#' 
#' @format A shapefile with 167 rows and 20 columns
#' 
#' @docType data
"sle_adm3"



#' @title Population data at admin level 3 for Sierra Leone from Humanitarian Data Exchange
#'
#' @description
#' Population data at admin level 3 for Sierra Leone from Humanitarian Data Exchange
#' 
#' @details
#' This population data can be used with \link{linelist_cleaned_with_adm3} and 
#' \link{sle_adm3}.
#'  
#' @source This population data was downloaded from [Humanitarian Data Exchange](https://data.humdata.org/dataset/cod-ps-sle)
#' 
#' This is the original dataset and was not edited (other than renaming)
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-IGO](https://data.humdata.org/faqs/licenses) 
#' 
#' @format A shapefile with 167 rows and 20 columns
#' 
#' @docType data
"sle_admpop_adm3_2020"


#' @title Population data at admin level 3 for Sierra Leone from Humanitarian Data Exchange
#'
#' @description
#' Population data at admin level 3 for Sierra Leone from Humanitarian Data Exchange
#' 
#' @details
#' This population data can be used with \link{linelist_cleaned_with_adm3} and 
#' \link{sle_adm3}.
#'  
#' @source This population data was downloaded from [Humanitarian Data Exchange](https://data.humdata.org/dataset/cod-ps-sle)
#' 
#' This is the original dataset and was not edited (other than renaming)
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-IGO](https://data.humdata.org/faqs/licenses) 
#' 
#' @format A shapefile with 167 rows and 20 columns
#' 
#' @docType data
"sle_admpop_adm3_2020"



#' @title Outputs from {epinow2} based on fictional Ebola Virus Disease data simulating properties from the West African Ebola outbreak of 2014
#'
#' @description
#' Outputs from {epinow2} based on fictional Ebola Virus Disease data simulating properties from the West African Ebola outbreak of 2014
#' 
#' @details
#' These outputs are produced using \link{linelist_cleaned_rds} with [epinow2](https://epiforecasts.io/EpiNow2/)
#'  
#' @source This is direct output from use with \link{linelist_cleaned_rds}. 
#' 
#' This is the original dataset. 
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT) 
#' 
#' @format A large list
#' 
#' @docType data
"epinow_res"
#' @rdname epinow_res
"epinow_res"
#' @rdname epinow_res
"generation_time"
#' @rdname epinow_res
"incubation_period"