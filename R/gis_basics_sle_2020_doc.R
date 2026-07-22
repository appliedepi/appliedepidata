#' @title Population data at admin level 3 for Sierra Leone (GIS basics example)
#'
#' @description
#' Population data at admin level 3 for Sierra Leone from Humanitarian Data
#' Exchange, repackaged for the GIS basics mapping example.
#'
#' @details
#' Same content as \link{sle_admpop_adm3_2020}. Intended for use alongside
#' \link{gis_linelist_cleaned_with_adm3} in choropleth mapping exercises.
#'
#' @source This population data was downloaded from
#' [Humanitarian Data Exchange](https://data.humdata.org/dataset/cod-ps-sle).
#' No edits were made to this.
#'
#' Within this package the original dataset is gis_population_sle_admpop_adm3_2020.csv
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [CC by-IGO](https://data.humdata.org/faqs/licenses)
#'
#' @format A data frame with 167 rows and 28 columns
#'
#' @docType data
"gis_population_sle_admpop_adm3_2020"



#' @title Cleaned fictional Ebola linelist joined with admin-3 spatial data (GIS basics example)
#'
#' @description
#' Subset of cleaned fictional Ebola Virus Disease case linelist data with
#' additional admin-3 spatial join fields, repackaged for the GIS basics
#' mapping example.
#'
#' @details
#' Same content as \link{linelist_cleaned_with_adm3}. Intended for use alongside
#' \link{gis_population_sle_admpop_adm3_2020} in choropleth mapping exercises.
#'
#' @source This data is a cleaned version of \link{linelist_cleaned_rds}, which is cleaned
#' using code in the [epiRhandbook cleaning chapter](https://epirhandbook.com/en/new_pages/cleaning.html).
#'
#' Within this package the original dataset is gis_linelist_cleaned_with_adm3.rds
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT)
#'
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}
#' @format A data frame with 1000 rows and 31 columns
#'
#' @docType data
"gis_linelist_cleaned_with_adm3"



#' @title Fictional cumulative COVID-19 incidence by country (GIS basics example)
#'
#' @description
#' Fictional cumulative COVID-19 incidence by country, created for the GIS
#' basics choropleth mapping example.
#'
#' @details
#' This is fictional data created for teaching purposes, simulating a global
#' cumulative incidence table suitable for a world-map choropleth exercise.
#'
#' @source Fictional data created by Applied Epi for training purposes.
#'
#' Within this package the original dataset is gis_covid_incidence.csv
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
#'
#' @format A data frame with 238 rows and 3 columns
#'
#' @docType data
"gis_covid_incidence"



#' @title Age/sex population proportions for Sierra Leone (GIS basics example)
#'
#' @description
#' Age/sex population proportions for Sierra Leone, for the GIS basics
#' population pyramid example.
#'
#' @details
#' Same source as \link{sle_admpop_adm3_2020}. Intended for use in population
#' pyramid plotting exercises.
#'
#' @source This population data was downloaded from
#' [Humanitarian Data Exchange](https://data.humdata.org/dataset/cod-ps-sle).
#' No edits were made to this.
#'
#' Within this package the original dataset is gis_population_sle_population_statistics_sierraleone_2020.xlsx
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [CC by-IGO](https://data.humdata.org/faqs/licenses)
#'
#' @format A data frame with 3 rows and 18 columns
#'
#' @docType data
"gis_population_sle_population_statistics_sierraleone_2020"
