# This is lesson 1

library(sf)
library(mapview)
library(ggplot2)

#1st PART
erie_outline <- st_read('data/erie_outline.shp')

#Identify geometry type
st_geometry_type(erie_outline)

st_crs(erie_outline)
#Units has metres - so dealing with projected data, degrees would be un-projected data
#Has EPSG code
#UTM zone 17N - common projection, accurate areas at small distances

#Check 
st_bbox(erie_outline)
#Large values means we are dealing with projected data, un-projected data has -180 to 180 °

#Plot data - ggplot2 is much nicer than using base plotting system

plot(erie_outline$geometry)

ggplot() +
  geom_sf(data = erie_outline, fill="cyan", size=1.5)+
  #Add specific sf layer to plot
  #Options make it nicer 
  ggtitle("Lake Erie Outline")

#Mapview is also nice - is actually interactive! Can zoom in, and move around etc.
mapview(erie_outline)

#QUESTIONS about shape files:
#any .shp files should work
#but 1 .shp file requires a few other files
#format called geopackages (i.e. gpkg) as single packages

#how to generate .shp files?
#extracted from a "public" portal - country wise
#or use QGIS to create it manually

st_write(erie_outline, 'data/erie_outline.gpkg')


#2nd PART

erie_outline #only 1 attribute

erie_zones <- st_read('data/erie_zones.shp')

erie_zones #fishing zones

View(erie_zones) #check the format of the data
names(erie_zones) #also option to rename!
head(erie_zones)
#only work with one zone
zone_5 <- dplyr::filter(erie_zones, MGMTUNIT == "MU5")

mapview(erie_zones) + mapview(zone_5)
ggplot()+
  geom_sf(data=zone_5)

mapview(erie_zones, zcol = "MGMTUNIT")
ggplot()+
  geom_sf(data=erie_zones, aes(color=MGMTUNIT))+
  ggtitle('Management Units', subtitle = "colored by zones")+
  labs(color="Unit ID")

ggplot()+
  geom_sf(data=erie_zones, aes(color=MGMTUNIT, size = MGMTUNIT))+
    scale_size_manual(values = c(2,2,2,2,2))
  
#3rd PART: MAP OF FISH TRACKS

fish_tracks <- read.csv("data/fish_tracks.csv")
View(fish_tracks)

st_crs(erie_outline)

#convert fish_tracks locations to shape object 
fish_locations <- st_as_sf(fish_tracks, coords = c("X","Y"), crs = st_crs(erie_outline))
#if st_crs(4326) in lat-long units
#check projections of the object
st_crs(fish_locations) #ok as in UTM zone 17N
mapview(fish_locations)
table(fish_locations$animal_id) #only 2 fishs

#www.epsg.io --> to know more about codes / tutorials

#RASTER
library(raster)
library(rgdal)

GDALinfo("data/erie_bathy.tif") #info

erie_bathy <- raster("data/erie_bathy.tif")

summary(erie_bathy) #we should look at the metadata to know more about these numbers
mapview(erie_bathy) #elevation plot

#to plot with ggplot have to convert the raster layer to dataframe
erie_bathy_df <- as.data.frame(erie_bathy, xy = TRUE)
  
#nice static plot  
ggplot()+
  geom_raster(data=erie_bathy_df, aes(x = x , y = y, fill =erie_bathy))+
  scale_fill_viridis_c(na.value="deeppink")

#again into raster format!
minValue(erie_bathy)
maxValue(erie_bathy)

#hitogram of bathymetry dataset
ggplot()+
  geom_histogram(data=erie_bathy_df, aes(erie_bathy))


#LAST BIT
fish_locations_bathy <- extract(x = erie_bathy, 
                             y = as(fish_locations,"Spatial"), df = TRUE)
summary(fish_locations_bathy) #maybe 0 is not lake level as it is weird that fish went up to land (i.e. > 0)

ggplot()+
  geom_histogram(data=fish_locations_bathy,
                 aes(x=erie_bathy))

erie_bathy_cropped <- crop(x=erie_bathy, y = as(erie_outline, 
                          "Spatial"))
mapview(erie_bathy_cropped)

mapview(erie_bathy)+
  mapview(erie_bathy_cropped)

#https://rspatial.org/raster/pkg/index.html
#https://datacarpentry.org --> examples of data
  #rater time series data!
#Phyton or Rraster or QGIS but he is not using ArcGis


