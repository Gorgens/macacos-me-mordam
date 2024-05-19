# Instala e ativa o pacote dssd
#install.packages('dssd')
library(dssd)

# Importa a base de exemplo
shapefile.name = system.file("extdata", "TrackExample.shp", package = "dssd")

# Define a região de estudo a partir de um shapefile de polígono
region = make.region(region.name = "study area",
                      shape = shapefile.name)
plot(region)

# Cria o grid que será usado para avaliar a cobertura
cover = make.coverage(region, n.grid.points = 1000)

# Definie os parâmetros do design
design = make.design(region = region, 
                      design = "systematic",
                      line.length = 1300,
                      edge.protocol = "minus",
                      design.angle = 0,
                      truncation = 2,
                      coverage.grid = cover)

# Gerar um arranjo amostral
transects = generate.transects(design)
transects
plot(region, transects, covered.area = TRUE)

# Simula diversos arranjos amostral para delineamento defino e avaliar a cobertura da amostragem
design = run.coverage(design, reps = 99)
design

plot(design, subtitle = "Transectos sistemáticos, Esforço amostral = 1300 km") 
hist(get.coverage(design), xlab = "Cobertura amostral", main = "Histograma da cobertura amostral")
