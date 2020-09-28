
# open libraries
library(tidyverse)
library(sf)
library(raster)
library(exactextractr)

# read files
aoi <- read_sf("inputs/geospatial/land_lots.gpkg")
ndsm_2017 <- raster("outputs/raster/ndsm_2017.tif")
ndsm_2004 <- raster("outputs/raster/ndsm_2004.tif")

# extract zonal statistics
ndsm_2017[is.na(ndsm_2017)] <- 0
ndsm_aoi <- aoi %>%
  mutate(area_total = exact_extract(ndsm_2017, aoi, 'count'))

ndsm[ndsm == 0] <- NA
ndsm_aoi <- ndsm_aoi %>%
  mutate(area_building_2017 = exact_extract(ndsm_2017, aoi, 'count'),
         area_building_2004 = exact_extract(ndsm_2004, aoi, 'count'),
         bcr_2017 = area_building_2017*100/area_total,
         bcr_2004 = area_building_2004*100/area_total,
         bcr_diff = bcr_2017 - bcr_2004)

write_sf(ndsm_aoi, "outputs/geospatial/BCR.gpkg")

# remember to clean R environment
