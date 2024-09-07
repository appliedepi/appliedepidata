# appliedepidata

This package stores all Applied Epi data across books, case studies, courses and tutorials

## stuff to consider

### storage 
- folder structure 
  - **data** R datasets go in data folder
  - **inst/extdata**Non-R datasets go in inst>extdata
    - option for adding messy datasets a la [{medicaldata}](https://github.com/higgi13425/medicaldata/?tab=readme-ov-file#messy-datasets)
  - **internal data** additional complication is that when you build a package, you can make the Rda datasets (from data folder) "internal" (more efficient for file storage, as then become part of binary), and these are then access by doing package::dataset. They can also be imported directly from github using link to the file in data folder e.g. 'rio(<github-raw url>)'. Read this [r packages chapter](https://r-pkgs.org/data.html) for details. 
  - **data-raw** usually contains R scripts which are used for creating the exported or internal data (e.g. if have edited dataset, or where {usethis} internalises dataset)
  - **sysdata** probably the *tableoftables* should just stay in *extdata* but alternatively could go in sysdata which is not exported (i.e. just for package usage)  
- naming of datasets (human readable/localised user-facing with an internal lookup table of standardised dataset IDs)
  - ?WHO or HDx functions or standardised file naming 
    - no clear guidelines, [datacarpentry](https://datacarpentry.org/rr-organization1/01-file-naming/index.html) has basics and [OCHA](https://humanitarian.atlassian.net/wiki/spaces/imtoolbox/pages/42502092/File+Naming+Convention) very basic. Tidytuesday doesnt even enforce naming. 
  - versioning of datasets (and edits thereof, e.g. same data for diff bits of course)
    - define overarching source file and resulting child files
    - do these all go within the same folder? Or just defined by similar prefix/ID
  - ?language suffixes

### functions 
- [x] list available datasets  
  - ~~search available datasets (wrapper around list/*tableoftables* to make searchable by country, disease, language, name, ID, etc)~~
- [ ] get data (different to saving if just want to use within Rstudio, ?necessary - rather than have new users freakout about different ways of accessing the data)
- [ ] download/save dataset locally function (based on *tableoftables*)
- [ ] data dictionary for a dataset: start with wrapper for  [{datadict}](https://github.com/epicentre-msf/datadict) as demo, then either consider pulling parts to {epidict} or offer them help to get on CRAN. 
  - if decide to help w/ {datadict} then {epidict} would just become a fake data generator. 
  - odk example dictionary from [xlsxform](https://docs.getodk.org/xlsform/)
- [x] function which uses a data dict to create the description section in roxygen for a dataset
- [ ] in phase 2 could build helper functions that create the description file from *tableoftables* (then the user just needs to edit an excel file) 
- [ ] unit testing for functions
  - ?pull snapshots bit from [{gapminder}](https://github.com/jennybc/gapminder/) re changes to datasets

### Documentation 
- description file for each dataset in pkg
  - ideally: data dictionary used to fill in the *man* files for each
  - probably do the same way [alison horst](https://github.com/lter/lterdatasampler/) does
- readme/pkgdown table (adapted from *tableoftables*) listing available datasets, versions, languages, source, and where used (e.g. case study, course, tutorial, epirhandbook)  
   - ~~ideally can be fed by list datasets function~~
- ?pkgdown separated by heading for dictionaries and actual datasets, and cross-links between the two
- guideline for contributing datasets similar to [tidytuesday](https://github.com/rfordatascience/tidytuesday/blob/master/.github/pr_instructions.md)
- licensing: while the overall package repo will be GPL3, it is possible that individual datasets will come under a different license (so there needs to be a license section in documentation for each dataset)


- process for adding a new dataset: 
  - if a non-R (not .rda) file
    - place file in 'inst/extdata' folder
      - if adding a shapefile then zip it 
    - in console run 'usethis::use_data_raw(<name of your file w/out extension>)
    - read in the file with 'rio' and 'system.file'
    - make edits as needed
    - save with usethis::usedata()
  - if adding an .rda file: 
  
  

# Data Entry Guide for Dataset Metadata

Below is a table explaining how to fill in each variable in the dataset 
metadata Excel sheet (1tablesoftables.xlsx). This guide helps ensure 
consistency and completeness when adding new datasets to your collection.

| **Variable**          | **Description**                    |
|-----------------------|------------------------------------|
| **name**              | The filename of the dataset as it  |
|                       | appears in the `inst/extdata`      |
|                       | directory, **without** the file    |
|                       | extension. This should be unique   |
|                       | within the dataset group. Use      |
|                       | consistent and descriptive names   |
|                       | without spaces                     |
|                       |  (e.g., `AJS_AmTiman`,             |
|                       | `mortality_survey`).              |
| **type**              | The category or type of the        |
|                       | dataset (e.g., `linelist`,         |
|                       | `population`, `shape`, `survey`,   |
|                       | `dictionary`).                    |
| **extension**         | The file extension (e.g., `xlsx`,  |
|                       | `zip`).                            |
| **type_version**      | Used to identify the *original*    |
|                       | data set and associated child data |
|                       | Increment when format or variables |
|                       | change. As there may be multiple   |
|                       | linelists in one group, this would |
|                       | increment with the type.           |
| **data_version**      | Used to identify the *original*    |
|                       | data set and associated child data |
|                       | Increment when format or variables |
|                       | change. Ensure you document changes|
|                       | in the appropriate 'data-raw' file.|
| **language**          | Language code using [ISO 639-1     |
|                       | codes](https://en.wikipedia.org/   |
|                       | wiki/List_of_ISO_639-1_codes).     |
|                       | (e.g., `en`, `fr`).               |
| **country**           | Country code using [ISO 3166-1     |
|                       | alpha-3 codes](https://en.         |
|                       | wikipedia.org/wiki/ISO_3166-1_     |
|                       | alpha-3). (e.g., `tcd`).          |
| **scale**             | Geographic scale (e.g.             |
|                       | `subnational`, `national`          |
|                       | or `international`).               |
| **subject**           | Main subject of the dataset (e.g., |
|                       | `acute jaundice syndrome`).        |
| **context**           | Context of the data (e.g.,         |
|                       | `outbreak`, `survey`).            |
| **fictional**         | Is the dataset fictional (`yes`)   |
|                       | or real (`no`)?                   |
| **year**              | Year the data was collected (e.g., |
|                       | `2016`). The *earliest* year in    |
|                       | the dataset.                       |
| **description**       | Brief description of the dataset.  |
|                       | Ideally copy from roxyen docs     |
| **usage**             | Intended usage (e.g., `{sitrep}    |
|                       | walkthroughs`, `training`).        |
| **license**           | License for dataset (e.g., `gpl3`, |
|                       | `mit`).                           |
| **group_identifier**  | *DO NOT EDIT* 
|                       |  High-level identifier combining   |
|                       | subject, context, country, and     |
|                       | year (e.g.,                       |
|                       | `acute_jaundice_syndrome_outbreak_|
|                       | tcd_2016`).                       |
| **unique_identifier** | *DO NOT EDIT*                     |
|                       | Combines `group_identifier`, type,|
|                       | type_version, context, and year to|
|                       | create a unique identifier (e.g., |
|                       | `acute_jaundice_syndrome_outbreak_|
|                       | tcd_2016_linelist_1`).            |





For example, when adding an Ebola dataset, you would enter the information as 
shown below. The original dataset (whether it's from {outbreaks} or another source)
would be considered 'type_version' 1. If it’s the only linelist in its group, it 
remains 'type_version' 1. If a completely different linelist is added (not just an
edited version), increment the 'type_version' accordingly.

For any changes to the data (such as cleaning or changing nums of rows or columns),
increment the 'data_version' (e.g., 'data_version' 2), but the 'type_version' 
remains the same to indicate that it’s a derivative (or "child") of the original.
Each child dataset gets its own entry.

If a dataset is translated into a different language, create a new entry for
the translated version while keeping the 'data_version' and 'type_version' the same, 
but editing the 'language' column accordingly. 
This ensures you can trace back the parent-child relationship between datasets.


| **Variable**          | **Example Entry**                  |
|-----------------------|------------------------------------|
| **name**              | `linelist_cleaned`                 |
| **type**              | `linelist`                         |
| **extension**         | `xlsx`                             |
| **type_version**      | `1`                                |
| **data_version**      | `1`                                |
| **language**          | `en`                               |
| **country**           | `lbr`                              |
| **scale**             | `national`                         |
| **subject**           | `ebola`                            |
| **context**           | `outbreak`                         |
| **fictional**         | `yes`                              |
| **year**              | `2014`                             |
| **description**       | Linelist data from the Ebola virus |
|                       | disease outbreak in Liberia in     |
|                       | 2014.                              |
| **usage**             | `introexercises`, etc.             |
| **license**           | `gpl3`                             |
| **group_identifier**  | `ebola_outbreak_lbr_2014`          |
| **unique_identifier** | `ebola_outbreak_lbr_2014_linelist_1|
|                       | 1_outbreak_2014`                   |
