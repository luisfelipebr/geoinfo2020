
# measures processing time
start_time <- Sys.time()

# open libraries
library(tidyverse)
library(sf)
library(raster)
library(fasterize)
library(lidR)

# read files and filter buildings (dsm) and soil (dtm)
dsm <- readLAScatalog("inputs/lidar/")
opt_filter(dsm) <- "-keep_class 6"
projection(dsm) <- "+init=epsg:31983"

dtm <- readLAScatalog("inputs/lidar/")
opt_filter(dtm) <- "-keep_class 2"
projection(dtm) <- "+init=epsg:31983"

aoi <- read_sf("inputs/geospatial/land_lots.gpkg")

# create dtm (raster)
opt_output_files(dtm) <- ""
dtm_output <- grid_terrain(dtm, res = 0.5, algorithm = tin(), full_raster = TRUE)
writeRaster(dtm_output, "outputs/raster/dtm.tif")

# create ndsm (point cloud)
opt_output_files(dsm) <- "outputs/lidar/N{ORIGINALFILENAME}"
ndsm <- normalize_height(dsm, dtm_output, na.rm = TRUE)
rm(dtm_output)

# create ndsm (raster)
opt_output_files(ndsm) <- ""
ndsm_output <- grid_canopy(ndsm, res = 0.5, algorithm = dsmtin(max_edge = 4))
writeRaster(ndsm_output, "outputs/raster/ndsm_2017.tif")

# create 2004 ndsm
buildings <- read_sf("inputs/geospatial/buildings.gpkg")
edificacao_raster <- fasterize(buildings, ndsm_output, field = "ALTURA_EDI")
writeRaster(edificacao_raster, "outputs/raster/ndsm_2004.tif")

# measures processing time
end_time <- Sys.time()
processing_time <- end_time - start_time
processing_time

# remember to clean R environment
