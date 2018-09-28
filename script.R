library(sf)
library(dplyr)
library(rmapshaper)

simplygeojson <- function(x, name, keep){
  shp <- ms_simplify(x, keep=keep)
  write_sf(shp, dsn = paste0(name, "/","R", sprintf("%02d", as.numeric(unique(x$REGION))),".geojson"), delete_dsn = FALSE)
}

data1 <- lapply(paste0("R",sprintf("%02d",1:15)), function(x){read_sf(paste0("/Users/robsalasco/Documents/CENSO2017/Cartografia/",x,"/Comuna.shp"))})
lapply(data1, function(x) {simplygeojson(x, "Comunas", 0.01)})

#data2 <- lapply(paste0("R",sprintf("%02d",1:15)), function(x){read_sf(paste0("/Users/robsalasco/Documents/CENSO2017/Cartografia/",x,"/Provincia.shp"))})
#lapply(data2, function(x) {simplygeojson(x, "Provincias")})
#
#data3 <- lapply(paste0("R",sprintf("%02d",1:15)), function(x){read_sf(paste0("/Users/robsalasco/Documents/CENSO2017/Cartografia/",x,"/Manzana_Precensal.shp"))})
#lapply(data3, function(x) {simplygeojson(x, "Manzanas")})
#
#data4 <- lapply(paste0("R",sprintf("%02d",1:15)), function(x){read_sf(paste0("/Users/robsalasco/Documents/CENSO2017/Cartografia/",x,"/Region.shp"))})
#lapply(data4, function(x) {simplygeojson(x, "Regiones")})
#
#data5 <- lapply(paste0("R",sprintf("%02d",1:15)), function(x){read_sf(paste0("/Users/robsalasco/Documents/CENSO2017/Cartografia/",x,"/Distrito_Censal.shp"))})
#lapply(data5, function(x) {simplygeojson(x, "Distritos")})

