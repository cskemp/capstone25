library(tidyverse)
library(here)
library(sf)

rfile <- here("data", "coastline", "ne_50m_coastline.shp")

rl <- read_sf(rfile)

st_crs(rl) = 4326

rlplot <- ggplot(rl) + geom_sf()

dicts <- read_csv(here("data", "bila_dictionaries_withenv.csv"))

dloc <- dicts %>%
  select(glottocode, langname, longitude, latitude) %>% 
  unique()

dloc_sf <- st_as_sf(dloc, coords = c("longitude", "latitude"),
                    crs = 4326)

# nearest ez point to each dictionary
nrl <- st_nearest_feature(dloc_sf, rl)

distances <- st_distance(dloc_sf, rl[nrl,], by_element=TRUE)

dloc_sf$ocean_dist<- distances

d_ocean <- dloc_sf %>%
  select(glottocode, ocean_dist) %>%
  rename(ocean_distance=ocean_dist)

fulldict_withdistance <- dicts %>%
   left_join(d_ocean, by = "glottocode")

print_vars <- fulldict_withdistance %>%
  select(glottocode, langname, longitude, latitude, ocean_distance) %>%
  distinct() %>%
  write_csv(here("output", "lang_ocean.csv" ))
