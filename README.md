# Building Coverage Ratio estimate from LiDAR remote sensing technology data: an experiment in São Paulo (Brazil)

This project is under development.

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
