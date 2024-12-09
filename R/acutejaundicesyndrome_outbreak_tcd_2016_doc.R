#' @title Linelist data from an outbreak of Acute Jaundice Syndrome (AJS) in Chad 2016
#'
#' @description
#' Linelist data from a real outbreak of Hepatitis E virus (HEV) infection which
#' occurred in the town of Am Timan, Chad, between October 2016 and
#' April 2017. 
#'  
#' @details
#' This is a case-linelist which contains de-indentified individual level data 
#' on clinical, laboratory and epidemiological information. It can be used 
#' together with \link{AJS_AmTiman_population}, \link{Blocksshape} and 
#' \link{Quartiersshape}. 
#' Please note, that some data has been adapted in order to best achieve
#' training objectives. Also, the GPS coordinates included in the dataset
#' do not correspond to real cases identified during this outbreak.
#' They have been generated exclusively for training purposes.
#'  
#' @source This data was collected as part of Doctors Without Borders (MSF) outbreak 
#' response and the the Ministry of Health (MoH) in Chad has approved the use 
#' of this data for training purposes. 
#' 
#' The original dataset is AJS_AmTiman.xlsx. 
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @references {Spina A, Lenglet A, et al. (2017) A large outbreak of Hepatitis E virus genotype 1 infection in an urban setting in Chad likely linked to household level transmission factors, 2016-2017. PLoS ONE 12(11): e0188240} \doi{10.1371/journal.pone.0188240}
#' 
#' @format A data frame with 1477 rows and 122 columns
#' 
#' @docType data
"AJS_AmTiman"





#' @title Population data from an outbreak of Acute Jaundice Syndrome (AJS) in Chad 2016
#'
#' @description
#' Population data from a real outbreak of Hepatitis E virus (HEV) infection which
#' occurred in the town of Am Timan, Chad, between October 2016 and
#' April 2017. 
#'  
#' @details
#' This contains population counts for houses and individuals in each of 
#' the housing blocks found in \link{Blocksshape} and can also be used together 
#' with \link{AJS_AmTiman}. 
#'  
#' @source This data was collected as part of Doctors Without Borders (MSF) outbreak 
#' response and the the Ministry of Health (MoH) in Chad has approved the use 
#' of this data for training purposes. 
#'
#' The original dataset is 'AJS_AmTiman_population.xlsx'. 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @references {Spina A, Lenglet A, et al. (2017) A large outbreak of Hepatitis E virus genotype 1 infection in an urban setting in Chad likely linked to household level transmission factors, 2016-2017. PLoS ONE 12(11): e0188240} \doi{10.1371/journal.pone.0188240}
#' 
#' @format A data frame with 648 rows and 3 columns:
#' 
#' @docType data
"AJS_AmTiman_population"


#' @title Shapefile of housing blocks from an outbreak of Acute Jaundice Syndrome (AJS) in Chad 2016
#'
#' @description
#' Shapefile data from a real outbreak of Hepatitis E virus (HEV) infection which
#' occurred in the town of Am Timan, Chad, between October 2016 and
#' April 2017. 
#'  
#' @details
#' This contains a shapefile for housing blocks which correspond with the population
#' counts found in \link{AJS_AmTiman_population} and can also be used together 
#' with \link{AJS_AmTiman}. 
#'  
#' @source This data was collected as part of Doctors Without Borders (MSF) outbreak 
#' response and the the Ministry of Health (MoH) in Chad has approved the use 
#' of this data for training purposes. 
#' 
#' The original dataset is 'Blocksshape.zip' (which contains the necessary 
#' Shapefile components). 
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @references {Spina A, Lenglet A, et al. (2017) A large outbreak of Hepatitis E virus genotype 1 infection in an urban setting in Chad likely linked to household level transmission factors, 2016-2017. PLoS ONE 12(11): e0188240} \doi{10.1371/journal.pone.0188240}
#' 
#' @format A data frame with 650 rows and 3 columns
#' 
#' @docType data
"Blocksshape"



#' @title Shapefile of neighbourhoods (*fr*: quartiers) from an outbreak of Acute Jaundice Syndrome (AJS) in Chad 2016
#'
#' @description
#' Shapefile data from a real outbreak of Hepatitis E virus (HEV) infection which
#' occurred in the town of Am Timan, Chad, between October 2016 and
#' April 2017. 
#'  
#' @details
#' This contains a shapefile for neighbourhoods which correspond with the population
#' counts found in \link{AJS_AmTiman_population} and can also be used together 
#' with \link{AJS_AmTiman}. 
#'  
#' @source This data was collected as part of Doctors Without Borders (MSF) outbreak 
#' response and the the Ministry of Health (MoH) in Chad has approved the use 
#' of this data for training purposes. 
#'
#' The original dataset is 'Blocksshape.zip' (which contains the necessary 
#' Shapefile components). 
#'  
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 
#' 
#' @references {Spina A, Lenglet A, et al. (2017) A large outbreak of Hepatitis E virus genotype 1 infection in an urban setting in Chad likely linked to household level transmission factors, 2016-2017. PLoS ONE 12(11): e0188240} \doi{10.1371/journal.pone.0188240}
#' 
#' @format A data frame with 34 rows and 3 columns
#' 
#' @docType data
"Quartiersshape"