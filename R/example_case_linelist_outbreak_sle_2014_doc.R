#' @title Dated snapshot of fictional case linelist data simulating properties from the West African Ebola outbreak of 2014
#'
#' @description
#' A dated snapshot (2020-10-08) of fictional case linelist data simulating
#' properties from the West African Ebola outbreak of 2014, prepared for an
#' iteration/loops example folder.
#'
#' @details
#' Same content as \link{linelist_raw} / \link{case_linelists_linelist_raw},
#' repackaged as one file in a dated series intended to demonstrate reading
#' in and combining multiple files.
#'
#' @source This data was originally added to the {outbreaks} package, extensive
#' edits have been made for teaching purposes. Within this package the
#' original dataset is example_case_linelist_2020-10-08.xlsx.
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT)
#'
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}
#' @format A data frame with 6611 rows and 28 columns
#'
#' @docType data
"example_case_linelist_2020_10_08"



#' @title Combined hospital linelists example, fictional Ebola Virus Disease data (West Africa, 2014)
#'
#' @description
#' Excel file with the combined (all-hospital) cleaned version of fictional
#' case linelist data simulating properties from the West African Ebola
#' outbreak of 2014, prepared for an iteration/loops example folder.
#'
#' @details
#' Same content as \link{hospital_linelists}. Intended to be compared against
#' the per-hospital splits \link{example_central_hospital},
#' \link{example_military_hospital}, \link{example_port_hospital},
#' \link{example_st_marks_maternity_hospital}, \link{example_missing}, and
#' \link{example_other}, which together reconstruct this same data when
#' row-bound.
#'
#' @source This data is a cleaned version of \link{example_case_linelist_2020_10_08}.
#' Within this package the original dataset is example_hospital_linelists.xlsx.
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT)
#'
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}
#' @format A data frame with 454 rows and 30 columns
#'
#' @docType data
"example_hospital_linelists"



#' @title Central Hospital subset, fictional Ebola Virus Disease case linelist (West Africa, 2014)
#'
#' @description
#' Central Hospital subset of the cleaned fictional Ebola Virus Disease case
#' linelist, one of six per-hospital files prepared for an iteration/loops
#' example where multiple files are read in and combined.
#'
#' @details
#' Row subset of \link{example_hospital_linelists} / \link{hospital_linelists}
#' filtered to cases reported at Central Hospital. See also
#' \link{example_military_hospital}, \link{example_port_hospital},
#' \link{example_st_marks_maternity_hospital}, \link{example_missing}, and
#' \link{example_other}.
#'
#' @source Within this package the original dataset is `example_central_hospital.csv`.
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT)
#'
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}
#' @format A data frame with 454 rows and 30 columns
#'
#' @docType data
"example_central_hospital"



#' @title Military Hospital subset, fictional Ebola Virus Disease case linelist (West Africa, 2014)
#'
#' @description
#' Military Hospital subset of the cleaned fictional Ebola Virus Disease case
#' linelist, one of six per-hospital files prepared for an iteration/loops
#' example where multiple files are read in and combined.
#'
#' @details
#' Row subset of \link{example_hospital_linelists} / \link{hospital_linelists}
#' filtered to cases reported at Military Hospital. See also
#' \link{example_central_hospital}, \link{example_port_hospital},
#' \link{example_st_marks_maternity_hospital}, \link{example_missing}, and
#' \link{example_other}.
#'
#' @source Within this package the original dataset is `example_military_hospital.csv`.
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT)
#'
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}
#' @format A data frame with 896 rows and 30 columns
#'
#' @docType data
"example_military_hospital"



#' @title Port Hospital subset, fictional Ebola Virus Disease case linelist (West Africa, 2014)
#'
#' @description
#' Port Hospital subset of the cleaned fictional Ebola Virus Disease case
#' linelist, one of six per-hospital files prepared for an iteration/loops
#' example where multiple files are read in and combined.
#'
#' @details
#' Row subset of \link{example_hospital_linelists} / \link{hospital_linelists}
#' filtered to cases reported at Port Hospital. See also
#' \link{example_central_hospital}, \link{example_military_hospital},
#' \link{example_st_marks_maternity_hospital}, \link{example_missing}, and
#' \link{example_other}.
#'
#' @source Within this package the original dataset is `example_port_hospital.csv`.
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT)
#'
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}
#' @format A data frame with 1762 rows and 30 columns
#'
#' @docType data
"example_port_hospital"



#' @title St. Mark's Maternity Hospital (SMMH) subset, fictional Ebola Virus Disease case linelist (West Africa, 2014)
#'
#' @description
#' St. Mark's Maternity Hospital (SMMH) subset of the cleaned fictional Ebola
#' Virus Disease case linelist, one of six per-hospital files prepared for an
#' iteration/loops example where multiple files are read in and combined.
#'
#' @details
#' Row subset of \link{example_hospital_linelists} / \link{hospital_linelists}
#' filtered to cases reported at St. Mark's Maternity Hospital (SMMH). See
#' also \link{example_central_hospital}, \link{example_military_hospital},
#' \link{example_port_hospital}, \link{example_missing}, and \link{example_other}.
#'
#' @source Within this package the original dataset is
#' `example_st_marks_maternity_hospital.csv`.
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT)
#'
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}
#' @format A data frame with 422 rows and 30 columns
#'
#' @docType data
"example_st_marks_maternity_hospital"



#' @title Missing-hospital subset, fictional Ebola Virus Disease case linelist (West Africa, 2014)
#'
#' @description
#' Subset of the cleaned fictional Ebola Virus Disease case linelist for cases
#' with no recorded hospital, one of six per-hospital files prepared for an
#' iteration/loops example where multiple files are read in and combined.
#'
#' @details
#' Row subset of \link{example_hospital_linelists} / \link{hospital_linelists}
#' filtered to cases with a missing hospital value. See also
#' \link{example_central_hospital}, \link{example_military_hospital},
#' \link{example_port_hospital}, \link{example_st_marks_maternity_hospital},
#' and \link{example_other}.
#'
#' @source Within this package the original dataset is `example_Missing.csv`.
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT)
#'
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}
#' @format A data frame with 1469 rows and 30 columns
#'
#' @docType data
"example_missing"



#' @title Other-hospital subset, fictional Ebola Virus Disease case linelist (West Africa, 2014)
#'
#' @description
#' Subset of the cleaned fictional Ebola Virus Disease case linelist for cases
#' reported at hospitals grouped as "Other", one of six per-hospital files
#' prepared for an iteration/loops example where multiple files are read in
#' and combined.
#'
#' @details
#' Row subset of \link{example_hospital_linelists} / \link{hospital_linelists}
#' filtered to cases reported at hospitals grouped as "Other". See also
#' \link{example_central_hospital}, \link{example_military_hospital},
#' \link{example_port_hospital}, \link{example_st_marks_maternity_hospital},
#' and \link{example_missing}.
#'
#' @source Within this package the original dataset is `example_Other.csv`.
#'
#' This is version 1.0.
#'
#' This dataset is English.
#'
#' This dataset is licensed under [MIT](https://opensource.org/license/MIT)
#'
#' @references {WHO Ebola Response Team. 2014. Ebola virus disease in West Africa–the first 9 months of the epidemic and forward projections. The New England journal of medicine 371:1481–1495} \doi{10.1056/NEJMoa1411100}
#' @format A data frame with 885 rows and 30 columns
#'
#' @docType data
"example_other"
