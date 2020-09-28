# Building Coverage Ratio estimate from LiDAR remote sensing technology data: an experiment in São Paulo (Brazil)

## Tutorial

1. Download this project and unzip it.

2. Download the inputs and outputs folders and unzip them inside the project folder. You can download them [here](https://1drv.ms/u/s!AjettDH-3Gbni_UC-IKX7FivhsyGhQ?e=8jPOsV).

3. Open this project `geoinfo2020.Rproj` with RStudio.

If you are using other R environment, remember to set the working directory.

``` {r}
setwd("~/geoinfo2020/")
```

4. Install the dependencies, if you don't have them installed yet.

``` {r}
install.packages(c("tidyverse", "sf", "raster", "lidr", "fasterize", "exactextractr"))
```

5. Run the scripts, in order.

6. The outputs will appear in the outputs folder.

## References

R Core Team (2020). R: A language and environment for statistical computing. R
  Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.
  
Wickham et al., (2019). Welcome to the tidyverse. Journal of Open Source Software,
  4(43), 1686, https://doi.org/10.21105/joss.01686
  
Pebesma, E., 2018. Simple Features for R: Standardized Support for Spatial Vector Data.
  The R Journal 10 (1), 439-446, https://doi.org/10.32614/RJ-2018-009
  
Robert J. Hijmans (2020). raster: Geographic Data Analysis and Modeling. R package
  version 3.3-13. https://CRAN.R-project.org/package=raster
  
Jean-Romain Roussel and David Auty (2020). lidR: Airborne LiDAR Data Manipulation and
  Visualization for Forestry Applications. R package version 3.0.3.
  https://CRAN.R-project.org/package=lidR
  
Noam Ross (2020). fasterize: Fast Polygon to Raster Conversion. R package version
  1.0.3. https://CRAN.R-project.org/package=fasterize
  
Daniel Baston (2020). exactextractr: Fast Extraction from Raster Datasets using
  Polygons. https://isciences.gitlab.io/exactextractr/,
  https://github.com/isciences/exactextractr.
