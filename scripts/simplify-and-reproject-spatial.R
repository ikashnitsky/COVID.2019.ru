#===============================================================================
# 2021-01-31 -- COVID.2019.ru
# Simplify spatial polygons and reproject the spatial file
# Ilya Kashnitsky, ilya.kashnitsky@gmail.com
#===============================================================================

library(sf) # this is the rspatial 2.0
library(rmapshaper)
library(tidyverse)

# read the file as sf object, reproject (see epsg.io), simplify
ru_reg <- st_read("misc/ESRI.shapefile/GADM.RUS_adm.modified.shp") %>%
    st_transform(crs = 5940) %>%
    ms_simplify(keep = .01)

st_write(obj = ru_reg, "misc/ESRI.shapefile/simplified.shp")

# create a layer with just the borders as lines
ru_bord <- ru_reg %>% ms_innerlines()

st_write(obj = ru_bord, "misc/ESRI.shapefile/borders.shp")

# # example mapping with ggplot and sf
# ru_reg %>%
#     ggplot()+
#     geom_sf(aes(fill = LOCUS %>% nchar()), size = .1)+
#     scale_fill_fermenter(palette = 4, direction = 1)+
#     cowplot::theme_map()+
#     theme(legend.position = "bottom")
#
# ggsave(filename = "~/Downloads/foo.png",
#        width = 7, height = 4)
