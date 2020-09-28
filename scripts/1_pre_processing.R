
##### NOTE: IT IS POSSIBLE TO AUTOMATE THIS SCRIPT TO LOOP OVER
#####       AND REMOVE TIDYVERSE DEPENDENCY

# open libraries
library(tidyverse)
library(sf)
library(raster)

# fix land lots data
lote_66 <- read_sf("inputs/geospatial/LOTES/SIRGAS_SHP_LOTES_66_REPUBLICA.shp")
st_crs(lote_66) <-  31983

lote_78 <- read_sf("inputs/geospatial/LOTES/SIRGAS_SHP_LOTES_78_SE.shp")
st_crs(lote_78) <- 31983

lote_aoi <- bind_rows(lote_66, lote_78)
write_sf(lote_aoi, "inputs/geospatial/land_lots.gpkg")

# fix districts data
distrito <- read_sf("inputs/geospatial/DISTRITO/DEINFO_DISTRITO.shp") %>% 
  filter(COD_DIST %in% c("66", "78"))
distrito <- st_transform(distrito, 31983)
write_sf(distrito, "inputs/geospatial/districts.gpkg")

# fix buildings data
edificacao <- read_sf("inputs/geospatial/EDIFICACAO/DEINFO_EDIFICACAO.shp")
edificacao <- st_transform(edificacao, 31983)
edificacao_aoi <- st_intersection(edificacao, distrito) %>% filter(st_is(., "POLYGON"))
write_sf(edificacao_aoi, "inputs/geospatial/buildings.gpkg")

# remember to clean R environment
