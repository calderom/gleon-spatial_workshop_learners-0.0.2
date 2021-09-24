
## Working with Geospatial Data

> by Jem Stachelek

-----

:spiral_calendar: September 24, 2021
:alarm_clock:     13:00 - 17:00  
:cloud: [rstudio.cloud/project/878317](https://rstudio.cloud/project/878317)     
:computer: [https://github.com/jsta/gleon-spatial_workshop_materials](https://github.com/jsta/gleon-spatial_workshop_materials)  
:memo: [collab document](https://bit.ly/gleon-collab): <https://bit.ly/gleon-collab>

-----

## Overview

## Learning objectives

Workshop participants will learn the basics of working with vector and raster data in `R`.

## Is this course for me?

You should be comfortable with routine R programming tasks (such as indexing vectors and lists).

Any lack of previous experience with geospatial analyses in R is not an issue. If you have experience, you'll see things in a new way. If you don't, we'll get you started on the right footing.

## Prework

1. Use your own system to install a working environment:
    - Download data from:
        https://github.com/jsta/gleon-spatial_workshop_learners/releases/download/0.0.1/gleon-spatial.zip
    - Install R and Rstudio
    - Install R packages
```r
install.packages(c("dplyr", "ggplot2", "raster", "rgdal", "rasterVis", "sf", "mapview"))
# If you encounter errors you may need to install external prerequsite programs:
# https://datacarpentry.org/geospatial-workshop/setup.html
```

2. An alternative to (1) if you can't (or don't want to) use your own RStudio system--e.g. a laptop or an institutional server. Shortly before the workshop starts, open up a new project in `rstudio.cloud` by following this link: [rstudio.cloud/project/878317](https://rstudio.cloud/project/878317). 
    - You may be prompted to set up an account, which is free. If you already have an account, use that.
    - Your `rstudio.cloud` project is yours and you can leave it for future reference or delete it after the workshop: your choice.
    - Packages will be pre-installed and data will be pre-downloaded on `rstudio.cloud`

## Schedule

| Time          | Topic                       | 
| :------------ | :-------------------------- |
| 13:00 - 13:30 | Intoduction and Setup       |
| 13:30 - 14:00 | Geospatial background       | 
| 14:00 - 14:30 | Open and plot vector files  |
| 14:30 - 14:40 | *Break*                     |
| 14:40 - 15:40 | Explore vector attributes   |
| 15:40 - 16:20 | Convert from .csv to vector |
| 16:20 - 17:00 | Intro to raster data        |

## Instructors

* Jem Stachelek, `stachel2@msu.edu`

-----

![](https://i.creativecommons.org/l/by/4.0/88x31.png) This work is
licensed under a [Creative Commons Attribution 4.0 International
License](https://creativecommons.org/licenses/by/4.0/).
