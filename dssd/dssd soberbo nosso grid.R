# Instala e ativa o pacote dssd
#install.packages('dssd')
library(dssd)
require(raster)
require(sf)
require(dplyr)

# Importa area do soberbo
shapefile.name = 'soberbo_UTM23S.shp'

# Define a região de estudo a partir de um shapefile de polígono
region = make.region(region.name = "study area",
                      shape = shapefile.name)
plot(region)

# Cria o grid que será usado para avaliar a cobertura
user.grid = shapefile('gridmacacos.shp') %>% st_as_sf()

cover = make.coverage(region, n.grid.points = dim(user.grid)[1])

cover@grid$coverage.scores = rep(NA, dim(user.grid[1:17,])[1])
cover@grid$geometry = user.grid[1:17,]$geometry

# Definie os parâmetros do design
design = make.design(region = region,
                      transect.type = "line",
                      design = "systematic",
                      line.length = 7000,
                      edge.protocol = "minus",
                      design.angle = 90,
                      truncation = 20,
                      coverage.grid = cover)

# Gerar um arranjo amostral
transects = generate.transects(design)
plot(region, transects, covered.area = TRUE)

# Simula diversos arranjos amostral para delineamento defino e avaliar a cobertura da amostragem
design = run.coverage(design, reps = 10)
design

plot(design, subtitle = "Transectos sistemáticos, Esforço amostral = 7000 m") 
hist(get.coverage(design), xlab = "Cobertura amostral", main = "Histograma da cobertura amostral")
