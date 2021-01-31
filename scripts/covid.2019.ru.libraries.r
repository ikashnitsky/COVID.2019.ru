################################################################
# Nested under:
# covid.2019.ru.meta.r

################################################################
# Loading libraries, setting locale for time

library(maps)
library(TeachingDemos)
library(rgdal)
library(rmarkdown)
library(rjson)
library(xlsx)

Sys.setlocale("LC_TIME", "en_US.UTF-8")

# UPD  2021-02-01 ------------------------------
# Ilya Kashnitsky: for the improved maps
library(sf)
library(rmapshaper)

