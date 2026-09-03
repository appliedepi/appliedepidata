# Health facility points for Sierra Leone from OpenStreetMap

Health facility points (hospitals, clinics, doctors, dentists,
pharmacies) for Sierra Leone, extracted from OpenStreetMap and published
on the Humanitarian Data Exchange.

## Usage

``` r
sle_hf
```

## Format

A shapefile with 44 rows and 12 columns

## Source

This shapefile was downloaded from [Humanitarian Data
Exchange](https://data.humdata.org/dataset/hotosm_sierra_leone_health_facilities).
No edits were made to this.

This is the original dataset is sle_hf.shp

This is version 1.0.

This dataset is English.

This dataset is licensed under the [Open Database License
(ODbL)](https://opendatacommons.org/licenses/odbl/1-0/), (c)
OpenStreetMap contributors.

## Details

This shapefile can be used together with
[sle_adm3](https://appliedepi.github.io/appliedepidata/reference/sle_adm3.md)
and
[linelist_cleaned_with_adm3](https://appliedepi.github.io/appliedepidata/reference/linelist_cleaned_with_adm3.md).
The Epidemiologist R Handbook's GIS basics chapter joins each case to
its nearest facility and draws catchment buffers around the facilities.
The export was made with the HOT Export Tool with the filter
`healthcare IS NOT NULL OR amenity IN ('doctors','dentist','clinic', 'hospital','pharmacy')`.
